# Does it load and can it be instanced

use Test;
BEGIN { plan tests => 3 };

use Rcs::Parser;
ok(1);

my $rcs = new Rcs::Parser;
ok(defined $rcs);

my $ret = $rcs->load('t/test.rcs,v');
ok($ret == 1);
