# get available containers
function __fish_distrobox_complete_containers
  distrobox list | sed 1d | awk -F'|' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//'
end

complete -c distrobox-rm -f

# global options
complete -c distrobox-rm -s h -l help -d "show help"
complete -c distrobox-rm -s v -l verbose -d "show more verbosity"
complete -c distrobox-rm -s V -l version -d "show version"

# rm
complete -c distrobox-rm -s a -l all -d "delete all distroboxes"
complete -c distrobox-rm -s f -l force -d "force deletion"
complete -c distrobox-rm -l rm-home -d "remove the mounted home if it differs from the host user's one"
complete -f -c distrobox-rm -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
