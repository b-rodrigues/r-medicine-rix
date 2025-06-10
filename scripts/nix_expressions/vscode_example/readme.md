On windows only, it is possible to use VS Code or Positron natively on Windows to interact
with Nix shells installed on WSL. This requires following instructions 
[here](https://code.visualstudio.com/docs/remote/wsl) and the 
[direnv](https://marketplace.visualstudio.com/items?itemName=mkhl.direnv) extension.
Also, you need to add a `.envrc` file with the text `use nix` in it. This file
is used by direnv to load the Nix environment.
If you want to do this, you need to set `ide = "none"` and add `{languageserver}` to
the list of R packages to install (if you’re using VS Code, `{languageserver}` is 
not required if you plan to use Positron).
