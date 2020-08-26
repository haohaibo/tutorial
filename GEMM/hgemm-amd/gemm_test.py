#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function, division
import os
import numpy as np
import argparse as ap
import pyopencl as cl


def magic(d):
    """ Calculate (magic, shift) of number d
    Args:
        d: number
    Returns:
        magic: magic number
        shift: shfit number
    """
    d = np.int32(d)
    ad = np.uint32(np.abs(d))
    two31 = np.uint32(0x80000000)
    t = two31 + np.right_shift(np.uint32(d), np.uint32(31))
    anc = t - np.uint32(1) - t % ad
    p = np.int32(31)
    q1 = two31 // anc
    r1 = two31 - q1 * anc
    q2 = two31 // ad
    r2 = two31 - q2 * ad
    while True:
        p = p + np.int32(1)
        q1 = np.uint32(2) * q1
        r1 = np.uint32(2) * r1
        if r1 >= anc:
            q1 = q1 + np.uint32(1)
            r1 = r1 - anc
        q2 = np.uint32(2) * q2
        r2 = np.uint32(2) * r2
        if r2 >= ad:
            q2 = q2 + np.uint32(1)
            r2 = r2 - ad
        delta = ad - r2
        if not ((q1 < delta) or (q1 == delta and r1 == np.uint32(0))):
            break
    m = np.int32(q2 + np.uint32(1))
    if d < np.int32(0):
        m = -m
    s = p - np.int32(32)
    return m, s


class Hgemm:
    """
    Class which holds tuning parameters and acts as a kernel launcher
    """
    def __init__(self, filename, ctx, dev):
        with open(filename, 'rb') as f:
            prog_binary = f.read()
        self.prog  = cl.Program(ctx, dev, [prog_binary]).build()

    def __call__(self, queue, clA, clB, clC, wait=None):
        launch = getattr(self.prog, self.kernelName)
        if (self.implement == "rocm"):
            return launch(queue, [self.gnumx * 8, self.gnumy * 8], [8, 8],
                          clA, clB, clC,
                          self.ldA, self.ldB, self.ldC,
                          self.M, self.N, self.K,
                          self.a, self.b,
                          self.magic, self.shift,
                          self.gnumx, self.gnumy,
                          wait_for = wait)
        else:
            return launch(queue, [self.gnumx * 8, self.gnumy * 8], [8, 8],
                          clA, clB, clC,
                          self.ldA, self.ldB, self.ldC,
                          self.M, self.N, self.K,
                          self.a, self.b,
                          self.magic, self.shift,
                          wait_for = wait)

    def tune(self, M, N, K, ldA, ldB, ldC, alpha = 1.0, beta = 0.0, transA = 'N', transB = 'N', implement = None):
        self.M = np.uint32(M)
        self.N = np.uint32(N)
        self.K = np.uint32(K)
        self.ldA = np.uint32(ldA)
        self.ldB = np.uint32(ldB)
        self.ldC = np.uint32(ldC)
        self.a = np.float16(alpha)
        self.b = np.float16(beta)
        self.kernelName = ("hgemm_col_%(transA)s%(transB)s_64x64_8x8" % locals()).lower()
        self.gnumx = np.uint32((self.M - 1) // 64 + 1)
        self.gnumy = np.uint32((self.N - 1) // 64 + 1)
        self.magic, self.shift = magic(self.gnumy)
        self.implement = implement

if __name__ == '__main__':

    parser = ap.ArgumentParser(usage = '%(prog)s [options] <kernel_path>',
                               description = 'GEMM driver & benchmark',
                               formatter_class = lambda prog: ap.HelpFormatter(prog, max_help_position = 27))
    parser.add_argument('kernel', help = 'path to kernel binary file')
    parser.add_argument('-r', '--repeat', default = 1, metavar = 'N',
                        help = 'number of repeats for kernel execution', type = int)
    parser.add_argument('-tA', '--transA', default = 'N', metavar = 'TRANS',
                        help = 'transpose op(A)', choices = ['N'])
    parser.add_argument('-tB', '--transB', default = 'T', metavar = 'TRANS',
                        help = 'transpose op(B)', choices = ['T'])
    parser.add_argument('-m', default = 6144, metavar = 'SIZE',
                        help = 'matrix dimension m', type = int)
    parser.add_argument('-n', default = 6144, metavar = 'SIZE',
                        help = 'matrix dimension n', type = int)
    parser.add_argument('-k', default = 6144, metavar = 'SIZE',
                        help = 'matrix dimension k', type = int)
    parser.add_argument('-a', '--alpha', default = 1.0, metavar = 'ALPHA',
                        help = 'alpha', type = float)
    parser.add_argument('-b', '--beta', default = 0.0, metavar = 'BETA',
                        help = 'beta', type = float)
    parser.add_argument('-t', '--type', default = "rocm", metavar = 'TYPE',
                        help = 'platform type(rocm, gcn)', type = str)
    parser.add_argument('-c', '--arch', required = True, metavar = 'ARCH',
                        help = 'machine arch(Fiji|Vega, gfx803|gfx900)', type = str)
    parser.add_argument('-v', '--verify', action = 'store_true',
                        help = "whether to do verify")
    args = parser.parse_args()

    if(not os.path.exists(args.kernel)):
        print("[ERROR]: kernel @ %s not exists" % (args.kernel))
        exit(0)
    if(not (args.type == "rocm" or args.type == "gcn")):
        print("[ERROR]: implement = %s not supported" % (args.type))
        exit(0)
    if((args.type == "rocm" and not (args.arch == "gfx803" or args.arch == "gfx900")) or\
       (args.type == "gcn" and not (args.arch == "Fiji" or args.arch == "Vega"))):
        print("[ERROR]: arch = %s not supported" % (args.arch))
        exit(0)

    #print("[INFO]: implement = %s" % (args.type))
    #print("[INFO]: arch = %s" % (args.arch))
    #print("[INFO]: kernel @ %s" % (args.kernel))
    #print("[INFO]: repeat %d times" % (args.repeat))
    #print("[INFO]: transA = %s" % (args.transA))
    #print("[INFO]: transB = %s" % (args.transB))
    #print("[INFO]: m = %d" % (args.m))
    #print("[INFO]: n = %d" % (args.n))
    #print("[INFO]: k = %d" % (args.k))
    #print("[INFO]: alpha = %f" % (args.alpha))
    #print("[INFO]: beta = %f" % (args.beta))
    #print("[INFO]: verify = %s" % (args.verify))

    # create platform, cq
    platforms  = filter(lambda p: 'AMD' in p.name, cl.get_platforms())
    devices    = filter(lambda d: args.arch == d.name, platforms[0].get_devices())
    assert len(devices) == 1
    ctx   = cl.Context(devices)
    queue = cl.CommandQueue(ctx, properties = cl.command_queue_properties.PROFILING_ENABLE)
    hgemm = Hgemm(args.kernel, ctx, devices)
    hgemm.tune(args.m, args.n, args.k,\
               args.m, args.n, args.m,\
               args.alpha, args.beta,\
               args.transA, args.transB,\
               implement = args.type)

    #A = np.asfortranarray(np.random.rand(args.m, args.k).astype(np.float16))
    #B = np.asfortranarray(np.random.rand(args.n, args.k).astype(np.float16))
    #A = np.asfortranarray(np.tril(np.full((args.m, args.k),1.0)).astype(np.float16))
    #B = np.asfortranarray(np.triu(np.full((args.n, args.k),1.0)).astype(np.float16))
    #A = np.asfortranarray(np.random.randint(0, high=3, size=(args.m, args.k)).astype(np.float16))
    #B = np.asfortranarray(np.random.randint(0, high=3, size=(args.n, args.k)).astype(np.float16))
    A = np.asfortranarray(np.ones((args.m, args.k)).astype(np.float16))
    B = np.asfortranarray(np.ones((args.n, args.k)).astype(np.float16))
    #A = np.ones((args.m, args.k), dtype=np.float16, order='F')
    #B = np.ones((args.n, args.k), dtype=np.float16, order='F')
    C = np.zeros((args.m, args.n), dtype=np.float16, order='F')
    V = np.copy(C)
    mf = cl.mem_flags
    clA = cl.Buffer(ctx, mf.READ_ONLY | mf.COPY_HOST_PTR, hostbuf=A)
    clB = cl.Buffer(ctx, mf.READ_ONLY | mf.COPY_HOST_PTR, hostbuf=B)
    clC = cl.Buffer(ctx, mf.COPY_HOST_PTR, hostbuf=C)

    queue.finish()
    #tops = 2 * args.m * args.n * args.k / 1000000000000.0
    gops = 2 * args.m * args.n * args.k / 1000000000.0
    calc_time_sum = 0.0
    for i in xrange(args.repeat):
        event = hgemm(queue, clA, clB, clC)
        event.wait()
        calc_time = (event.profile.end - event.profile.start) / 1000000000.0
        calc_time_sum += calc_time
        #tflops = tops / calc_time
        gflops = gops / calc_time
        #print("[INFO]: time: %f sec. perf: %f TFLOPS" % (calc_time, tflops))
        #print("[INFO]: time: %f sec. perf: %f GFLOPS" % (calc_time, gflops))
    cl.enqueue_copy(queue, C, clC).wait()
    #tflops_avg = tops / (calc_time_sum / args.repeat)
    gflops_avg = gops / (calc_time_sum / args.repeat)
    #print("[INFO]: Ops: %f gops" % (gops))
    #print("[INFO]: AVERAGE perf: %f TFLOPS" % (tflops_avg))
    #print("[INFO]: AVERAGE perf: %f GFLOPS" % (gflops_avg))
    #print("[INFO]: AVERAGE perf/theory: %f " % (gflops_avg/8192.0))
    print("%d  %f" % (args.m, gflops_avg/8192.0))

    if(args.verify):
        V = args.alpha * np.dot(A, B)
        #np.savetxt("diff.txt", C - V, fmt='%.10e')
        np.savetxt("V.txt", V, fmt='%.10e')
        np.savetxt("C.txt", C, fmt='%.10e')
