# Does the module parse out versions correctly

use Test::Simple tests => 3;

my @versions = qw/1.109 1.108 1.107 1.106 1.105 1.104 1.103 1.102 1.101 
1.100 1.99 1.98 1.97 1.96 1.95 1.94 1.93 1.92 1.91 1.90 1.89 1.88 1.87 
1.86 1.85 1.84 1.83 1.82 1.81 1.80 1.79 1.78 1.77 1.76 1.75 1.74 1.73 
1.72 1.71 1.70 1.69 1.68 1.67 1.66 1.65 1.64 1.63 1.62 1.61 1.60 1.59 
1.58 1.57 1.56 1.55 1.54 1.53 1.52 1.51 1.50 1.49 1.48 1.47 1.46 1.45 
1.44 1.43 1.42 1.41 1.40 1.39 1.38 1.37 1.36 1.35 1.34 1.33 1.32 1.31 
1.30 1.29 1.28 1.27 1.26 1.25 1.24 1.23 1.22 1.21 1.20 1.19 1.18 1.17 
1.16 1.15 1.14 1.13 1.12 1.11 1.10 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1/;

use Rcs::Parser;

my $rcs = new Rcs::Parser;
my $ret = $rcs->load('t/test.rcs,v');

my @test = $rcs->all_versions();

ok(@test);
ok(scalar(@test) == 109);
ok(join(':',@versions) eq join(':',@test),'Sort order');

unless ( join(':',@versions) eq join(':',@test) ) {
  print STDERR "Order is wrong: \n\n",  join(':',@versions), "\n\n",  join(':',@test), "\n\n";
}
