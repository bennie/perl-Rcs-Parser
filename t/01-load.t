# Does it load and can it be instanced

use Test;
BEGIN { plan tests => 2 };

use Rcs::Parser;
ok(1);

my $rcs = new Rcs::Parser;
ok(defined $rcs);
