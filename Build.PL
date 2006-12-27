use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Data::Tabulate',
    license             => 'perl',
    dist_author         => 'Renee Baecker <module@renee-baecker.de>',
    dist_version_from   => 'lib/Data/Tabulate.pm',
    build_requires      => {
        'Test::More'          => 0,
        'Test::CheckManifest' => 1.0,
        'Carp'                => 0,
    },
    add_to_cleanup      => [ 'Data::Tabulate-*' ],
);

$builder->create_build_script();
