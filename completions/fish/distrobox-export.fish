complete -c distrobox-export -f

# global options
complete -c distrobox-export -s h -l help -d "show help"
complete -c distrobox-export -s v -l verbose -d "show more verbosity"
complete -c distrobox-export -s V -l version -d "show version"

# list
complete -c distrobox-export -s a -l app -d "name of the application to export"
complete -c distrobox-export -s b -l bin -d "absolute path of the binary to export"
complete -c distrobox-export -l list-apps -d "list applications exported from this container"
complete -c distrobox-export -l list-binaries -d "list binaries exported from this container, use -ep to specify custom paths to search"
complete -c distrobox-export -s d -l delete -d "delete exported application or binary"
complete -c distrobox-export -o el -l export-label -d "label to add to exported application name, use \"none\" to disable"
complete -c distrobox-export -o ep -l export-path -d "path where to export the binary"
complete -c distrobox-export -o ef -l export-flags -d "extra flags to add to the command"
complete -c distrobox-export -o nf -l enter-flags -d "flags to add to distrobox-enter"
complete -c distrobox-export -s S -l sudo -d "specify if the exported item should be run as sudo"
