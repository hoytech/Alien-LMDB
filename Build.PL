use strict;
use warnings;

use Alien::Base::ModuleBuild;


my $builder = Alien::Base::ModuleBuild->new(
  module_name => 'Alien::LMDB',
  dist_abstract => 'Build and install the LMDB embedded database',
  license => 'openldap',
  configure_requires => {
    'Alien::Base' => '0.003',
    'Module::Build' => '0.38',
  },
  requires => {
    'perl' => '5.8.1',
    'Alien::Base' => 0,
  },
  dist_author => 'Doug Hoyte <doug@hcsw.org>',
  meta_merge => {
      resources => {
          homepage => 'https://github.com/hoytech/Alien-LMDB',
          bugtracker => 'https://github.com/hoytech/Alien-LMDB/issues',
          repository  => 'git://github.com/hoytech/Alien-LMDB.git',
      },
  }, 

  alien_name => 'lmdb',
  ## https://github.com/LMDB/lmdb/releases
  alien_repository => {
    protocol => 'local',
    location => 'inc',
    pattern  => qr/^LMDB_([\d.]+)\.tar\.gz$/,
  },
  alien_build_commands => [
    'make -C libraries/liblmdb/',
  ],
  alien_test_commands => [
    'make -C libraries/liblmdb/ test >/dev/null',
  ],
  alien_install_commands => [
    'make -C libraries/liblmdb/ install prefix=%s',
  ],
);

$builder->create_build_script;
