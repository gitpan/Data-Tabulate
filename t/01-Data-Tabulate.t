#!perl -T

use Test::More (0 ? (tests => 70) : 'no_plan');
use Data::Tabulate qw/rows columns/;

sub _inspect {
    my $rows = shift;
    diag "\n";
    diag join " ", @$_ for @$rows;
}

my ($set, $table);

$set = Data::Tabulate->new([ 'a' .. 'z' ], rows => 6)->rows;
$set = Data::Tabulate->new([ 'a' .. 'z' ], rows => 6)->columns;
$set = Data::Tabulate->new([ 'a' .. 'z' ], columns => 4, pad => 1)->rows;

################
# column major #
################

$set = columns [ 'a' .. 'z' ], 3, column_major => 1;
is_deeply($set->[0], [ 'a' .. 'i' ]);
is_deeply($set->[1], [ 'j' .. 'r' ]);
is_deeply($set->[2], [ 's' .. 'z' ]);

#$set = rows [ 'a' .. 'z' ], 2;
$set = rows [ 'a' .. 'z' ], 2, column_major => 1;
is_deeply($set->[0], [ qw/a c e g i k m o q s u w y/ ]);
is_deeply($set->[1], [ qw/b d f h j l n p r t v x z/ ]);

is_deeply(rows([ 'a' .. 'z' ], 3, column_major => 1), Data::Tabulate->rows([ 'a' .. 'z' ], 3, column_major => 1));

$table = Data::Tabulate->new([ 'a' .. 'z' ], columns => 4, column_major => 1);
is_deeply(columns([ 'a' .. 'z' ], 4, column_major => 1), $table->columns);

#############
# row major #
#############

$set = columns [ 'a' .. 'z' ], 3;
is_deeply($set->[0], [ qw/a d g j m p s v y/ ]);
is_deeply($set->[1], [ qw/b e h k n q t w z/ ]);
is_deeply($set->[2], [ qw/c f i l o r u x/ ]);

$set = rows [ 'a' .. 'z' ], 2;
is_deeply($set->[0], [ 'a' .. 'm' ]);
is_deeply($set->[1], [ 'n' .. 'z' ]);

is_deeply(rows([ 'a' .. 'z' ], 3), Data::Tabulate->rows([ 'a' .. 'z' ], 3));

$table = Data::Tabulate->new([ 'a' .. 'z' ], columns => 4);
is_deeply(columns([ 'a' .. 'z' ], 4), $table->columns);