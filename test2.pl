#!/usr/bin/perl -Ilib

use Rcs::Parser;
use strict;

my $rcs = new Rcs::Parser;

$rcs->{debug}=1;
$rcs->load('t/test.rcs,v');

