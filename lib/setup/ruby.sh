${RubyVersion:=2.4}

setup_ruby()
{(
        from . import os

        if is_macos; then
                setup_ruby_for_macos "$@"
        fi
)}

setup_ruby_for_macos()
{(
        from . import brew

        brew_install ruby@$RubyVersion
)}
