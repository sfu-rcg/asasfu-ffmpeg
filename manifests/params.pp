# == Class ffmpeg::params
#
# This class is meant to be called from ffmpeg
# It sets variables according to platform.
#
class ffmpeg::params {
  case $::osfamily {
    'redhat': {
      case $::operatingsystem {
        CentOS: {
          case $::operatingsystemmajrelease {
            6: { $required_repos = 'atrpms' }
            7: { $required_repos = 'atrpms' }
            default: {
              $required_repos = ''
              fail("${::operatingsystem} version ${::operatingsystemmajrelease} not supported")
            }
          }
        }
        default: { 
          $required_repos = ''
          fail("${::operatingsystem} not supported")
        }
      }
    }
    default: { 
      $required_repos = ''
      fail("${::osfamily} not supported")
    }
  }
}
