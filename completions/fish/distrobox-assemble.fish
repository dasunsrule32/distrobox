complete -c distrobox-assemble -f

# global options
complete -c distrobox-assemble -s h -l help -d "show help"
complete -c distrobox-assemble -s v -l verbose -d "show more verbosity"
complete -c distrobox-assemble -s V -l version -d "show version"

# assemble
complete -c distrobox-assemble -ra "create rm"
complete -c distrobox-assemble -l file -F -d "path or URL to the distrobox manifest/ini file"
complete -c distrobox-assemble -s n -l name -d "run against a single entry in the manifest/ini file"
complete -c distrobox-assemble -s R -l replace -d "replace already existing distroboxes with matching names"
complete -c distrobox-assemble -s d -l dry-run -d "only print the container manager command generated"
