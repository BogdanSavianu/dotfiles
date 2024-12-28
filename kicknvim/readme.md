In this repository lies my Neovim configuration starting from
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

The provided `init.lua` file has then been split into (tentatively) semantically
consistent files inside `lua/` and personal customizations have been applied.

The process to design this configuration and some thoughts can be found [here](https://blog.epheme.re/software/nvim-kickstart.html).

## Testing it

To try it, you can use the `NVIM_APPNAME` environment variable:
- [Practicalii Neovim: Neovim Configuration](https://practical.li/neovim/configuration/)

For instance, you can create clone this repository inside
`$HOME/.config/kicknvim` and then add to your shell configuration:

```sh
export NVIM_APPNAME="$HOME/.config/kicknvim"
```
