( import pjkit/brew && setup_brew && brew_bundle_install )
( import pjkit/docker && dockermachine create $DockerMachineName )

( . "$0.d/project.sh" )
