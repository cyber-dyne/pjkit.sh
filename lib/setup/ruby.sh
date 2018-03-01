${RubyVersion:=2.4}

setup_ruby()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Ruby.'

        from . import os

        if is_macos; then
                setup_ruby_for_macos "$@"
        fi
)}

setup_ruby_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Ruby.'

        from . import brew

        brew_install ruby@$RubyVersion
)}
