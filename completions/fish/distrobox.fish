# get available containers
function __fish_distrobox_complete_containers
  distrobox list | sed 1d | awk -F'|' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//'
end

# get available images
function __fish_distrobox_complete_images
  distrobox create -C | sed 1d
end

# global options
complete -c distrobox -s h -l help -d "show help"
complete -c distrobox -s v -l verbose -d "show more verbosity"
complete -c distrobox -s V -l version -d "show version"

# read subcommands into variable
set -l subcommands assemble create enter list ls rm stop upgrade ephemeral generate-entry version help

complete -c distrobox -f

# assemble
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a assemble \
	 -d "create and destroy container based on config file"
complete -c distrobox -n "__fish_seen_subcommand_from assemble" -ra "create rm"
complete -c distrobox -n "__fish_seen_subcommand_from assemble" \
	 -l file -F -d "path or URL to the distrobox manifest/ini file"
complete -c distrobox -n "__fish_seen_subcommand_from assemble" \
	 -s n -l name -d "run against a single entry in the manifest/ini file"
complete -c distrobox -n "__fish_seen_subcommand_from assemble" \
	 -s R -l replace -d "replace already existing distroboxes with matching names"
complete -c distrobox -n "__fish_seen_subcommand_from assemble" \
	 -s d -l dry-run -d "only print the container manager command generated"

# create
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a create \
	 -d "create container"
#complete -f -c distrobox -n "__fish_seen_subcommand_from create; and not __fish_seen_subcommand_from (__fish_distrobox_complete_images)" -a "(__fish_distrobox_complete_images)" \
	#	 -s -i -l image -d "specify image to use for the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s i -l image -d "specify image to use for the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s n -l name -d "name for the distrobox"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l hostname -d "specify hostname for the distrobox"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s p -l pull -d "pull the image even if it exists locally (implies --yes)"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s Y -l yes -d "non-interactive, pull images without asking"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s r -l root -d "launch with root privileges using podman/docker/lilipod"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s c -l clone -d "name of the distrobox container to use as base for a new container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s H -l home -d "select a custom HOME directory for the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l volume -d "add additional volumes to the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
         -s a -l additional-flags -d "additional flags to pass to the container manager command"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s ap -l additional-packages -d "additional packages to install during initial container setup"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l init-hooks -d "commands to execute during container initialization"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l pre-init-hooks -d "commands to execute prior to container initialization"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s I -l init -d "use an init system inside the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l nvidia -d "try to integrate host nVidia drivers into the guest"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l platform -d "specify which platform to use, eg: linux/arm64"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-devsys -d "do not share host devices and sysfs dirs from host"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-groups -d "do not forward user's additional groups into the container"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-ipc -d "do not share ipc namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-netns -d "do not share the net namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-process -d "do not share process namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l unshare-all -d "activate all the unshare flags"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -s C -l compatibility -d "show list of compatible images"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l no-entry -d "do not generate a container entry in the application list"
complete -c distrobox -n "__fish_seen_subcommand_from create"  \
	 -l absolutely-disable-root-password-i-am-really-positively-sure -d "skip user password setup, leaving it blank"
complete -c distrobox -n "__fish_seen_subcommand_from create" \
	 -s d -l dry-run -d "only print the container manager command generated"

# enter
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a enter \
	 -d "enter container"
complete -c distrobox -n "__fish_seen_subcommand_from enter" \
	 -s n -l name -d "name for the distrobox"
complete -c distrobox -n "__fish_seen_subcommand_from enter" \
	 -s e -d "end arguments and execute the rest as command to execute at login"
complete -c distrobox -n "__fish_seen_subcommand_from enter" \
	 -l clean-path -d "reset PATH inside container to FHS standard"
complete -c distrobox -n "__fish_seen_subcommand_from enter" \
	 -s T -l no-tty -d "do not instantiate a tty"
complete -f -c distrobox -n "__fish_seen_subcommand_from enter; and not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"
complete -c distrobox -n "__fish_seen_subcommand_from (__fish_distrobox_complete_containers); and not __fish_seen_subcommand_from --" -a "--" \
	 -d "end arguments and execute the rest as command to execute at login"

# list
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a list \
	 -d "list containers"
complete -c distrobox -n "__fish_seen_subcommand_from list" \
	 -l no-color -d "disable color formatting"

# ls
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a ls \
	 -d "list containers"
complete -c distrobox -n "__fish_seen_subcommand_from ls" \
	 -l no-color -d "disable color formatting"

# rm
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a rm \
	 -d "delete container(s)"
complete -c distrobox -n "__fish_seen_subcommand_from rm" \
	 -s a -l all -d "delete all distroboxes"
complete -c distrobox -n "__fish_seen_subcommand_from rm" \
	 -s f -l force -d "force deletion"
complete -c distrobox -n "__fish_seen_subcommand_from rm" \
	 -l rm-home -d "remove the mounted home if it differs from the host user's one"
complete -f -c distrobox -n "__fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"

# stop
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a stop \
	 -d "stop a running container"
complete -c distrobox -n "__fish_seen_subcommand_from stop" \
	 -s a -l all -d "delete all distroboxes"
complete -c distrobox -n "__fish_seen_subcommand_from stop" \
	 -s Y -l yes -d "non-interactive, stop without asking"
complete -f -c distrobox -n "__fish_seen_subcommand_from stop; and not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"

# upgrade
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a upgrade \
	 -d "upgrade one or more running containers"
complete -c distrobox -n "__fish_seen_subcommand_from upgrade" \
	 -s a -l all -d "perform for all distroboxes"
complete -c distrobox -n "__fish_seen_subcommand_from upgrade" \
	 -l running -d "perform only for running distroboxes"
complete -f -c distrobox -n "__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"

# ephemeral
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a ephemeral \
	 -d "create a temporary distrobox container"
#complete -f -c distrobox -n "__fish_seen_subcommand_from ephemeral; and not __fish_seen_subcommand_from (__fish_distrobox_complete_images)" -a "(__fish_distrobox_complete_images)" \
	#	 -s -i -l image -d "specify image to use for the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s i -l image -d "specify image to use for the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s n -l name -d "name for the distrobox"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l hostname -d "specify hostname for the distrobox"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s p -l pull -d "pull the image even if it exists locally (implies --yes)"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s Y -l yes -d "non-interactive, pull images without asking"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s r -l root -d "launch with root privileges using podman/docker/lilipod"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s c -l clone -d "name of the distrobox container to use as base for a new container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s H -l home -d "select a custom HOME directory for the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l volume -d "add additional volumes to the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
         -s a -l additional-flags -d "additional flags to pass to the container manager command"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s ap -l additional-packages -d "additional packages to install during initial container setup"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l init-hooks -d "commands to execute during container initialization"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l pre-init-hooks -d "commands to execute prior to container initialization"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s I -l init -d "use an init system inside the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l nvidia -d "try to integrate host nVidia drivers into the guest"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l platform -d "specify which platform to use, eg: linux/arm64"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-devsys -d "do not share host devices and sysfs dirs from host"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-groups -d "do not forward user's additional groups into the container"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-ipc -d "do not share ipc namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-netns -d "do not share the net namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-process -d "do not share process namespace with host"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l unshare-all -d "activate all the unshare flags"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -s C -l compatibility -d "show list of compatible images"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l no-entry -d "do not generate a container entry in the application list"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral"  \
	 -l absolutely-disable-root-password-i-am-really-positively-sure -d "skip user password setup, leaving it blank"
complete -c distrobox -n "__fish_seen_subcommand_from ephemeral" \
	 -s d -l dry-run -d "only print the container manager command generated"

# generate-entry
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a generate-entry \
	 -d "create entry of created container in application list"
complete -c distrobox -n "__fish_seen_subcommand_from generate-entry" \
	 -s d -l delete -d "delete the entry"
complete -c distrobox -n "__fish_seen_subcommand_from generate-entry" \
	 -s i -l icon -d "specify a custom icon (default auto)"
complete -f -c distrobox -n "__fish_seen_subcommand_from generate-entry; and not __fish_seen_subcommand_from (__fish_distrobox_complete_containers)" \
	 -a "(__fish_distrobox_complete_containers)"

# version
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a version \
	 -d "print distrobox version"

# help
complete -c distrobox -n "not __fish_seen_subcommand_from $subcommands" -a help \
	 -d "print help"
