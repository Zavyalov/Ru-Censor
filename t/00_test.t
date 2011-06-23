#!/usr/bin/perl
use uni::perl;
# $Id: test.pl,v 1.1.1.1 2000/09/05 08:55:38 artur Exp $
#

use Data::Dumper;

my $loaded = 1;
BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Censure;
print "ok 1\n";

my ($w,@w);

slangControl("бля") or print "not ";
print "ok 2\n";

if ($w = slangControl_wd("бля")) {
    if ($w ne "бля") {
        print "not ";
    }
}
else {
    print "not ";
}
print "ok 3 $w\n";

if (@w = slangControl_ar("бля")) {
    if ($w[0] ne "бля" || $w[1] ne "бля") {
        print "not ";
    }
}
else {
    print "not ";
}
print "ok 4 @w\n";

setChangeType("beep");
if (@w = slangControl_change("бля")) {
    if ($w[0][0] ne "бля" || $w[0][1] ne "бип") {
        print "not ";
    }
}
else {
    print "not ";
}
print "ok 5 ".Dumper(@w)."\n";

setChangeType("flower");
setOneWord(0);
@w=slangControl_change(split(' ', "Б л я! На горе четыре хуя танцевали краковяк, один ><уй другого хуя хyeм по хуую хуяк! Сам ты х*й"));
for (@w) {
    print $_->[0];
    print " ";
}
say;

for (@w) {
    print $_->[1]?$_->[1]:$_->[0];
    print " ";
}
say;

exit;
