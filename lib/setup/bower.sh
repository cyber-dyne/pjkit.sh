setup_bower()
{(
        echo '[DEPRECATED] Use NPM/Yarn to install Bower.'

        # from . import os
        from . import npm

        # if is_macos; then
        #         setup_bower_for_macos "$@"
        # fi

        npm_install -g bower
)}

setup_bower_for_macos()
{(
        echo '[DEPRECATED] Use NPM/Yarn to install Bower.'

        from . import brew

        brew_install bower
)}
