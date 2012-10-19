use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'LDReseller',
    AUTHOR              => q{YOUR NAME <youremail@example.com>},
    VERSION_FROM        => 'lib/LDReseller.pm',
    ABSTRACT            => 'YOUR APPLICATION ABSTRACT',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.31,
        'DBIx::Class::EncodedColumn'    => 0,
        'DBIx::Class::InflateColumn::DateTime' => 0,
        'Dancer::Plugin::DBIC'  => 0,
        'Dancer::Plugin::FlashMessage'  => 0,
        'Digest::MD5'   => 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'LDReseller-*' },
);
