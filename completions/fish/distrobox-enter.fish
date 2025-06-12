complete -c distrobox-enter -f

# global options
complete -c distrobox-enter -s h -l help -d "show help"
complete -c distrobox-enter -s v -l verbose -d "show more verbosity"
complete -c distrobox-enter -s V -l version -d "show version"

# enter
complete -c distrobox-enter -s n -l name -d "name for the distrobox"
complete -c distrobox-enter -s e -d "end arguments and execute the rest as command to execute at login"
complete -c distrobox-enter -l clean-path -d "reset PATH inside container to FHS standard"
complete -c distrobox-enter -s T -l no-tty -d "do not instantiate a tty"
complete -f -c distrobox-enter -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
complete -c distrobox-enter -n "__fish_seen_subcommand_from (__fish_distrobox_complete_containers); and not __fish_seen_subcommand_from --" -a "--" \
	 -d "end arguments and execute the rest as command to execute at login"
