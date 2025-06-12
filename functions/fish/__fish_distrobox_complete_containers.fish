# get available containers
function __fish_distrobox_complete_containers
  distrobox list | sed 1d | awk -F'|' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//'
end
