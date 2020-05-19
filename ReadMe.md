# Latexmk Action

This action compiles one or more TeX files using Latexmk.


## Inputs

### `latexmkrc`

**Optional** Path to the `.latexmkrc` file. By default, the action will search for all `latexmkrc` and `.latexmkrc` files and compile all of them.

### `args`

**Optional** Arguments passed to `latexmk`. Default: `-cd`


## Example Usage

```yml
uses: reitermarkus/latexmk@master
with:
  args: ''
```
