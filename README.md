> By contributing to this project, you agree to abide by our [Code of Conduct](https://github.com/freedomofpress/.github/blob/main/CODE_OF_CONDUCT.md).

# securedrop-workstation-docs
User documentation for SecureDrop Workstation.

# Quickstart

1. [Install poetry](https://python-poetry.org/docs/#installation)
2. Install the dependencies using `poetry install`
3. Run `make docs` to start a live build of the documentation at http://localhost:8000
4. Edit [RST](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html) files under the docs directory - your changes will be reflected in the live build

## Stable and development builds

https://workstation.securedrop.org/ is automatically built from this repo. It redirects
to the stable version by default, which is built from the commit tagged `stable`.
The latest version tracks the tip of the `main` branch.

To tag a new stable version, delete the current `stable` tag, and push a new
individually signed, annotated `stable` tag (`git tag -sa stable`). When
doing so, be careful not to pull in documentation commits for changes that have
not been released yet.

## Detailed setup instructions for macOS

There are multiple ways to set your virtual environment; the following
procedure uses `pyenv` and `pyenv-virtualenv` installed by Homebrew.

### Set up pyenv and pyenv-virtualenv

Open a Terminal and run

```
brew update && brew upgrade && brew install pyenv pyenv-virtualenv
```

You may want to read more about [pyenv](https://github.com/pyenv/pyenv) and
[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv).

To ensure that these tools run properly, add the following lines to your
`~/.bash_profile` (or `~/.zprofile`) by opening that file in your favourite
text editor (you can use `nano ~/.bash_profile` to work on the command-line):

```
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

Reload your shell by typing `source ~/.bash_profile` in the Terminal app.

## Install Python 3

In the terminal, list available versions of python with `pyenv install --list` and install Python 3.x.x with `pyenv install 3.x.x` (the latest version of Python 3.5 is recommended).

## Clone repo, set up environment

- Clone this repo and `cd` into the `securedrop-workstation-docs` directory in
  the Terminal app, then run the following commands. You may replace `sdwdocs`
  with whatever name you wish to give this virtual environment, and `3.5.9`
  with whichever version of Python 3 you installed in the previous step:

  ```
  pyenv local 3.5.9
  pyenv virtualenv sdwdocs
  pyenv activate sdwdocs
  pip install --require-hashes -r requirements/requirements.txt
  ```

When the installation of dependencies completes, you can run `make docs` to build the documentation and view it in your browser at `127.0.0.1:8000`, or `make docs-lint` and `make docs-lintcheck` to check for style/formatting errors.

- When you're done, deactivate the virtual environment by typing
  ```
  pyenv deactivate sdwdocs
  ```

### Fix brew errors

If you run `brew doctor`, you may see the following warning:

```
Warning: "config" scripts exist outside your system or Homebrew directories.
`./configure` scripts often look for *-config scripts to determine if
software packages are installed, and what additional flags to use when
compiling and linking.

Having additional scripts in your path can confuse software installed via
Homebrew if the config script overrides a system or Homebrew provided
script of the same name. We found the following "config" scripts:

```

You can ignore this warning, or use one of the two possible fixes documented
in the [pyenv Github repo](https://github.com/pyenv/pyenv/issues/106).

For example, creating a file called `~/bin/brew` with the following contents:

```
#!/bin/sh

# from https://github.com/pyenv/pyenv/issues/106
if which pyenv > /dev/null 2>&1; then
  # assumes default location of brew in `/usr/local/bin/brew`
  /usr/bin/env PATH="${PATH//$(pyenv root)\/shims:/}" /usr/local/bin/brew "$@"
else
  /usr/local/bin/brew "$@"
fi
```
and adding `~/bin` to your PATH variable (`EXPORT PATH=${HOME}/bin:${PATH}`)
is a workaround for this issue.

Once you have finished making these changes, reload your shell by typing `source ~/.bash_profile` in the Terminal app.

# Testing

- Run `make docs-lint` to test documentation syntax
- Run `make docs-linkcheck` to check for broken outgoing links in the documentation
