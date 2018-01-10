from . import bower

: ${RxJsDir:=$BowerLibDir/bower_components/rxjs}

build_rxjs()
{(
        if test -e "$RxJsDir/dist"; then
                return
        fi

        from . import node
        from . import npm

        if test -e "$NodeLibDir/node_modules"; then
                ## Workaround for the tsc bug.
                mv "$NodeLibDir/node_modules" "$NodeLibDir/.node_modules"
        fi

        ## RxJS must be built.
        ## We use NPM for this task because it is a lot faster than Yarn.
        cd "$RxJsDir"
        npm install --depth 0 --loglevel=$NpmLogLevel
        npm run --loglevel=$NpmLogLevel build_global
        rm -rf node_modules ## Cleanup. This dir is huge and useless at this point.

        if test -e "$NodeLibDir/.node_modules"; then
                ## Workaround for the tsc bug.
                mv "$NodeLibDir/.node_modules" "$NodeLibDir/node_modules"
        fi
)}
