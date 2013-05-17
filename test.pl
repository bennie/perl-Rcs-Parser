#!/usr/bin/perl -Ilib

use strict;

#use Rcs::Parser;

#my $rcs = new Rcs::Parser;
#$rcs->load('t/test.rcs,v');

open INFILE, '<', 't/test.rcs,v';
my $data = join('',<INFILE>);
close INFILE;

print $data;

print "\n\n===\n\n";

my $header;

while ( $data =~ /\G(.+)\n/gcm ) {
  print "header: $1\n";
}

while ( $data =~ /\G\n/gcm ) {
  print "blank at ".pos($data)."\n";
}

while ( $data =~ /\G((\d(\.|\d)+).+?\n\n)/gcs ) {
  print "vheader $2: ".length($1)."\n";
}

while ( $data =~ /\G\n/gcm ) {
  print "blank at ".pos($data)."\n";
}

if ( $data =~ /\Gdesc\n\@\@\n/gcs || $data =~ /\Gdesc\n\@(.+?)(?<!\@)\@\n/gcs ) {
  print "desc: ".length($1)."\n";
}

while ( $data =~ /\G\n/gcm ) {
  print "blank at ".pos($data)."\n";
}

while ( $data =~ /\G(\d(\.|\d)+)\n/gcm ) {
  print "DATA $1:\n";

  while ( $data =~ /\G(\w+)\n\@\@\n/gcs || $data =~ /\G(\w+)\n\@(.+?)(?<!\@)\@\n/gcs ) {
    print " --> $1: ".length($2)."\n";
  }

  while ( $data =~ /\G\n/gcm ) {
    print "blank at ".pos($data)."\n";
  }
}

while ( $data =~ /\G\n/gcm ) {
  print "blank at ".pos($data)."\n";
}
