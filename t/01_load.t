use strict;
use Test::More 0.98;

use lib 't/lib';
use any XXX => qw/Baz Foo Bar/;

is xxx(), 'Foo', 'xxx() is exported';
isa_ok XXX(), 'Foo';
ok +exists $INC{'Foo.pm'}, 'Foo.pm is loaded';
ok !exists $INC{'Bar.pm'}, 'Bar.pm is not loaded';
ok !exists $INC{'Baz.pm'}, 'Baz.pm is not loaded';

done_testing;
