# get available images
function __fish_distrobox_complete_images
  distrobox create -C | sed 1d
end
