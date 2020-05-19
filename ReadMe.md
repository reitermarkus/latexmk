# Latexmk Action

This action compiles one or more TeX files using Latexmk.


## Inputs

### `directory`

**Optional** Directory in which to run `latexmk`. By default, the action will run `latexmk` in all directories containing a `latexmkrc` or `.latexmkrc` file. If it can't find any, it will simply run `latexmk` in the current working directory.

### `args`

**Optional** Arguments passed to `latexmk`. Defaults to `-cd`.


## Example Usage

```yml
uses: reitermarkus/latexmk@master
with:
  directory: thesis
```
