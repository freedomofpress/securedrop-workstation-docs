Removing the Passphrase from a GPG Key
======================================

First, note your secret key's ID. You can find it by running the command:

.. code-block:: sh

  gpg --list-secret-keys --keyid-format=long

This will show a list of keys known to GPG. Find the key you wish to remove the passphrase from - the ID will be in place of ``XXXX`` in the output example below.

.. code-block:: sh

  /home/username/.gnupg/secring.gpg
  ----------------------------------
  sec   4096R/XXXX <creation date>
  uid                  name <email.address>
  ssb   4096R/YYYY <creation date>

Using the key ID in place of ``XXXX``, open the edit key dialogue by running:

.. code-block:: sh

    gpg --edit-key XXXX

GPG will display information about the key and a prompt. Type ``passwd`` into the prompt and press enter. You will be asked for the current passphrase, type it and press enter. When asked for the new passphrase, simply leave the prompt blank and press enter again. Depending on the version of GPG and your desktop environment, you may receive a warning. You can dismiss this and proceed anyway.

