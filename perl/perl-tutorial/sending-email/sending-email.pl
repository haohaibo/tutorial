#!/usr/bin/perl

$to = 'haohaibo031113@163.com';

$from = 'haohaibo031113@163.com';
$from = 'test@runoob.com';

$subject = 'perl sending email test';
$message = 'this is an email using perl';

open(MAIL, "|/usr/sbin/sendmail -t");

print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n";

print MAIL $message;

close(MAIL);
print "send email sussessfully\n";

