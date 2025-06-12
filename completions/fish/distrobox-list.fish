complete -c distrobox-list -f

# global options
complete -c distrobox-list -s h -l help -d "show help"
complete -c distrobox-list -s v -l verbose -d "show more verbosity"
complete -c distrobox-list -s V -l version -d "show version"

# list
complete -c distrobox-list -l no-color -d "disable color formatting"
