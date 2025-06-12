# get available images
function __fish_distrobox_complete_images
  distrobox create -C | sed 1d
end

complete -c distrobox-ephemeral -f

# global options
complete -c distrobox-ephemeral -s h -l help -d "show help"
complete -c distrobox-ephemeral -s v -l verbose -d "show more verbosity"
complete -c distrobox-ephemeral -s V -l version -d "show version"


# ephemeral
#complete -f -c distrobox-ephemeral -n "not __fish_seen_subcommand_from (__fish_distrobox_complete_images)" -a "(__fish_distrobox_complete_images)" \
	#	 -s -i -l image -d "specify image to use for the container"
complete -c distrobox-ephemeral -s i -l image -d "specify image to use for the container"
complete -c distrobox-ephemeral -s n -l name -d "name for the distrobox"
complete -c distrobox-ephemeral -l hostname -d "specify hostname for the distrobox"
complete -c distrobox-ephemeral -s p -l pull -d "pull the image even if it exists locally (implies --yes)"
complete -c distrobox-ephemeral -s Y -l yes -d "non-interactive, pull images without asking"
complete -c distrobox-ephemeral -s r -l root -d "launch with root privileges using podman/docker/lilipod"
complete -c distrobox-ephemeral -s c -l clone -d "name of the distrobox container to use as base for a new container"
complete -c distrobox-ephemeral -s H -l home -d "select a custom HOME directory for the container"
complete -c distrobox-ephemeral -l volume -d "add additional volumes to the container"
complete -c distrobox-ephemeral -s a -l additional-flags -d "additional flags to pass to the container manager command"
complete -c distrobox-ephemeral -s ap -l additional-packages -d "additional packages to install during initial container setup"
complete -c distrobox-ephemeral -l init-hooks -d "commands to execute during container initialization"
complete -c distrobox-ephemeral -l pre-init-hooks -d "commands to execute prior to container initialization"
complete -c distrobox-ephemeral -s I -l init -d "use an init system inside the container"
complete -c distrobox-ephemeral -l nvidia -d "try to integrate host nVidia drivers into the guest"
complete -c distrobox-ephemeral -l platform -d "specify which platform to use, eg: linux/arm64"
complete -c distrobox-ephemeral -l unshare-devsys -d "do not share host devices and sysfs dirs from host"
complete -c distrobox-ephemeral -l unshare-groups -d "do not forward user's additional groups into the container"
complete -c distrobox-ephemeral -l unshare-ipc -d "do not share ipc namespace with host"
complete -c distrobox-ephemeral -l unshare-netns -d "do not share the net namespace with host"
complete -c distrobox-ephemeral -l unshare-process -d "do not share process namespace with host"
complete -c distrobox-ephemeral -l unshare-all -d "activate all the unshare flags"
complete -c distrobox-ephemeral -s C -l compatibility -d "show list of compatible images"
complete -c distrobox-ephemeral -l no-entry -d "do not generate a container entry in the application list"
complete -c distrobox-ephemeral -l absolutely-disable-root-password-i-am-really-positively-sure -d "skip user password setup, leaving it blank"
complete -c distrobox-ephemeral -s d -l dry-run -d "only print the container manager command generated"
