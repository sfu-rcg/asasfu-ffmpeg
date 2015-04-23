# == Class: ffmpeg
#
# Module to allow yum install and dependency management of ffmpeg 
# while allowing you to pick repos to enable for the run.
#
# === Parameters
#
# [*ensure_version*]
#  Ensure parameter passed to Package resource to ensure specific version or other 
#   option such as latest
#   Default: latest
#
# === Examples
#
#  class { '::ffmpeg':
#    ensure_version => '2.1.5-2.el7.nux',
#  }
#
# === Authors
#
# Adam S <asa188@sfu.ca>
#
# === Copyright
#
# Copyright 2015 Simon Fraser University, unless otherwise noted.
#
class ffmpeg (
  $ensure_version = 'latest',
  $required_repos = $::ffmpeg::params::required_repos
) inherits ::ffmpeg::params {
  include ::yumrepos
  package { 'ffmpeg':
    ensure => "${ensure_version}",
    install_options => { "--enablerepo" => "${required_repos}" },
    require => [ Class[::yumrepos] ],
  }
}
