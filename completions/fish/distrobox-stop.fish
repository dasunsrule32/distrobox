# get available containers
function __fish_distrobox_complete_containers
  distrobox list | sed 1d | awk -F'|' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//'
end

complete -c distrobox-stop -f

# global options
complete -c distrobox-stop -s h -l help -d "show help"
complete -c distrobox-stop -s v -l verbose -d "show more verbosity"
complete -c distrobox-stop -s V -l version -d "show version"

# stop
complete -c distrobox-stop -s a -l all -d "delete all distroboxes"
complete -c distrobox-stop -s Y -l yes -d "non-interactive, stop without asking"
complete -f -c distrobox-stop -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
