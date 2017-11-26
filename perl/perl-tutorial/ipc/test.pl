use IPC::Open3;

local(*HIS_IN, *HIS_OUT, *HIS_ERR);

my $cmd = 'ls -l';
$childpid = open3(*HIS_IN, *HIS_OUT, *HIS_ERR, $cmd, @args);
print HIS_IN "stuff\n";
close(HIS_IN);            # Give end of file to kid.

@inlines  = <HIS_IN>;
@outlines = <HIS_OUT>;    # Read till EOF.
@errlines = <HIS_ERR>;    # XXX: block potential if massive
print "STDIN:\n", @inlines, "\n";
print "STDOUT:\n", @outlines, "\n";
print "STDERR:\n", @errlines, "\n";
close HIS_OUT;
close HIS_ERR;

# 等待子进程结束
waitpid($childpid, 0);

# $? 表示返回系统调用的结果
print "\$?= $?\n";
if ($?) {
    print "That child exited with wait status of $?\n";
}

