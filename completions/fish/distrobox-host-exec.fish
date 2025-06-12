complete -c distrobox-host-exec -f

# global options
complete -c distrobox-host-exec -s h -l help -d "show help"
complete -c distrobox-host-exec -s v -l verbose -d "show more verbosity"
complete -c distrobox-host-exec -s V -l version -d "show version"

# list
complete -c distrobox-host-exec -s Y -l yes \
	 -d "Automatically answer yes to prompt host-spawn will be installed on the guest system if not detected"
