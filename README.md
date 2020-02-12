## minimum-envwrapper

Minimum virtual environment management, in portable POSIX Shell.

### Commands

* `mkvirtualenv VENV` - Create a new virtual environment
* `workon VENV` - Activate a virtual environment
* `lsvirtualenv` - List all virtual environments
* `rmvirtualenv VENV` - Delete a virtual environment

### Environment Variables

* `WORKON_HOME` - If defined, virtual environments will be placed in this
  directory. Otherwise, virtual environments will be created in
  `$HOME/.virtualenvs/`

### Example Usage

```
$ . ./minimum-envwrapper.sh   # (But really, put this in your shell rc.)
$ lsvirtualenv
$ mkvirtualenv new-venv
$ lsvirtualenv
new-venv
$ workon new-venv
$ which python
/home/user/.virtualenvs/new-venv/bin/python
$ rmvirtualenv new-venv
$ lsvirtualenv
$
```

### Requirements

- A POSIX compliant shell (BASH, ZSH, KSH, DASH, etc)
- The `venv` module, from the python3 standard library

### Motivation

1. This prevents me from needing to set up a virtual environment, so that I can
   manage my virtual environments.
1. python2 is finally dead, so this can rely on the python3 `venv` module.
1. I only used these 4 commands anyway.
1. The alternatives were not compatible with `ksh`.
