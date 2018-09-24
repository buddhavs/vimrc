vimrc
===
Forked from https://github.com/jeaye/vimrc
Modified based on my needs.

## Disable plugins
Rename package folder under ./layer to _"_folder" to disable plugins
within that folder from being installed/set.


## Installing and updating packages
This config uses [vim-plug](https://github.com/junegunn/vim-plug), so you'll
need to run `:PlugInstall` and possibly `:PlugUpdate` once you've linked in the
configs.

From there, you should occasionally run `:PlugUpdate` to keep your
plugins up-to-date.

You can also run `:PlugUpgrade` to upgrade vim-plug itself.
