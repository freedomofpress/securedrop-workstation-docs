# securedrop-workstation-docs
User documentation for the SecureDrop Workstation.

# Quickstart

- Set up and activate a Python 3 virtualenv using your preferred method for your system
- Install dependencies using `pip install --require-hashes -r requirements/requirements.txt`
- Run `make docs` to start a live build of the documentation at `http://127.0.0.1:8000`
- Edit RST files under the `docs` directory - your changes will be reflected in the live build

# Testing

- Run `make docs-lint` to test documentation syntax
- Run `make docs-linkcheck` to check for broken outgoing links in the documentation

