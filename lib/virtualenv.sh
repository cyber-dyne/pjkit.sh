# from . import env
# from . import path

# path_add "$VirtualenvDir/bin"

setup_virtualenv()
{(
        from . import pip

        pip_install "$@" virtualenv
)}
