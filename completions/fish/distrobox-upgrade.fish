complete -c distrobox-upgrade -f

# global options
complete -c distrobox-upgrade -s h -l help -d "show help"
complete -c distrobox-upgrade -s v -l verbose -d "show more verbosity"
complete -c distrobox-upgrade -s V -l version -d "show version"

# upgrade
complete -c distrobox-upgrade -s a -l all -d "perform for all distroboxes"
complete -c distrobox-upgrade -l running -d "perform only for running distroboxes"
complete -f -c distrobox-upgrade -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
