: ${PythonVersion:=3}   ## 2 | 3

setup_python()
{(
        from . import os

        if is_macos; then
                setup_python_for_macos "$@"
        fi
)}

setup_python_for_macos()
{(
        from . import brew

        brew_install python@${PythonVersion}
)}
