from . import env

: ${DockerArgs:=}
: ${DockerFile:=$ProjectDir/Dockerfile}
: ${DockerImageName:=default}
: ${DockerMachineDir:=$SystemDir/docker}
: ${DockerMachineName:=default}
: ${DockerMachineArgs:=--storage-path \"$DockerMachineDir\"}
: ${DockerComposeFile:=$ProjectDir/docker-compose.yml}
: ${DockerComposeArgs:=--file \"$DockerComposeFile\"}

docker()
{
        eval "set -- $DockerArgs $*"

        ${DockerBin:-$(which docker)} "$@"
}

dockermachine()
{
        eval "set -- $DockerMachineArgs $*"

        ${DockerMachineBin:-$(which docker-machine)} "$@"
}

dockermachine_env_eval()
{
        eval "$(dockermachine env $DockerMachineName)"
}

dockercompose()
{
        eval "set -- $DockerComposeArgs $*"

        ${DockerComposeBin:-$(which docker-compose)} "$@"
}
