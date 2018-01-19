: ${PipInstallArgs:=}

setup_pip()
{(
        from . import python

        eval "set -- ${EasyInstallArgs:---user}"        ## Per user setup.

        local python_bin="${PythonBin:-$(which python$PythonVersion)}"
        local python_version="$($python_bin --version | cut -d ' ' -f 2 | cut -d '.' -f 1-2)"
        local easyinstall_bin="${EasyInstallBin:-$(which easy_install-$python_version)}"

        $easyinstall_bin "$@" pip
)}

pip_install()
{(
        from . import python

        eval "set -- $PipInstallArgs $*"

        ${PipBin:-$(which pip$PythonVersion)} install "$@"
)}
