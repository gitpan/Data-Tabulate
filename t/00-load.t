#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Data::Tabulate' );
}

diag( "Testing Data::Tabulate $Data::Tabulate::VERSION, Perl $], $^X" );
