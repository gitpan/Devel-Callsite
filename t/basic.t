use Test::Simple tests => 6;
eval { require Devel::Callsite };
ok(!$@, "loading module");
eval { import Devel::Callsite };
ok(!$@, "running import");
my $site = sub { ${shift()} = callsite();};
$site->(\$callsite1);
$site->(\$callsite2);
ok($callsite1, "Valid first call");
ok($callsite2, "Valid second call");
ok($callsite1 != $callsite2, "Two separate calls");

ok(context() > 1, "Valid context call");
