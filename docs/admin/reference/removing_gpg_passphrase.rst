Removing the Passphrase from a GPG Key
======================================

First, in a ``dom0`` terminal on your Qubes workstation (Qubes Menu > ⚙️  > Other > Xfce Terminal) and assuming the key is in a file ``sd-journalist.sec`` in your home directory, import the passphrase-protected secret key:

.. code-block:: sh

  export GPGTMP=`mktemp -d`    # create a tempdir
  gpg --homedir=${GPGTMP} --pinentry=loopback --import sd-journalist.sec    

Next, check the key id:

.. code-block:: sh

  gpg --homedir=${GPGTMP} --list-secret-keys --keyid-format=long

The output should list the key with a line similar to:

.. code-block:: sh

  sec   rsa4096/XXXXXXXXXX <creation date>    

The ``XXXXXXXXXX`` value is the key id, which you can use to open the key in edit mode with the following command:

.. code-block:: sh

  gpg --homedir=${GPGTMP} --pinentry=loopback --edit-key XXXXXXXXXX

In the GPG interactive prompt, enter the command ``passwd`` to change the passphrase. You will first be prompted for the current passphrase, so enter that. Then, on the next prompt, just hit enter for a new blank passphrase, and enter again when prompted to repeat it. Then exit with the command ``quit``.

You should now have a passphrase-less version of the key in the $GPGTMP keyring. To export it, use the following command with the same key id as above:

.. code-block:: sh

  gpg --homedir=${GPGTMP} --export-secret-key --armor XXXXXXXXXX > /tmp/nopassphrase.sec

Verify that the new keyfile ``/tmp/nopassphrase.sec`` starts with the ``-----BEGIN PGP PRIVATE KEY BLOCK-----`` line. If it does, the export was successful. You can now copy it into place and check the config again with the commands:

.. code-block:: sh

  sudo cp /tmp/nopassphrase.sec /usr/share/securedrop-workstation-dom0-config/sd-journalist.sec
  sdw-admin --validate
