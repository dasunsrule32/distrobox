complete -c distrobox-generate-entry -f

# global options
complete -c distrobox-generate-entry -s h -l help -d "show help"
complete -c distrobox-generate-entry -s v -l verbose -d "show more verbosity"
complete -c distrobox-generate-entry -s V -l version -d "show version"

# generate-entry
complete -c distrobox-generate-entry -s d -l delete -d "delete the entry"
complete -c distrobox-generate-entry -s i -l icon -d "specify a custom icon (default auto)"
complete -f -c distrobox-generate-entry -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
