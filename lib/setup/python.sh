: ${PythonVersion:=3}   ## 2 | 3

setup_python()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Python.'

        from . import os

        if is_macos; then
                setup_python_for_macos "$@"
        fi
)}

setup_python_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Python.'

        from . import brew

        brew_install python@${PythonVersion}
)}
