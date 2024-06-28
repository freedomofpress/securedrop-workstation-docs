Backup and Restore
==================

.. include:: ../../includes/top-warning.rst

Qubes OS has a `backup utility <https://www.qubes-os.org/doc/backup-restore/>`_
that allows for backup and restoration of user-specified VMs.

To perform backups, you will need:

 - a LUKS-encrypted external hard drive, with at least 50GB space
 - a secure place to store backup credentials (such as a password manager
   on your primary laptop)

Backup
------

Preserve files from ``dom0``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Preserve key configuration files by coping them into the
``vault`` VM.

In a ``dom0`` Terminal via **Q > ⚙️ > Other > Xfce Terminal**:

  .. code-block:: sh

    cd /usr/share/securedrop-workstation-dom0-config
    qvm-copy-to-vm vault {config.json,sd-journalist.sec}

Open a ``vault`` Terminal and verify that the files were copied successfully:

  .. code-block:: sh

    head -n1 ~/QubesIncoming/dom0/sd-journalist.sec # line contains "BEGIN PRIVATE KEY BLOCK"
    grep -q hostname ~/QubesIncoming/dom0/config.json && echo OK # line is "OK"

.. note::
  If you have made advanced customizations to your Qubes Workstation,
  you may need to back up additional components of ``dom0``. Refer to
  the `Qubes documentation <https://www.qubes-os.org/doc/backup-restore/>`_
  or contact Support.

Back up SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensure your storage medium is plugged in, attached to ``sd-devices``,
and unlocked.

Navigate to **Q ▸ ⚙️ > Qubes Tools ▸ Backup Qubes**, and move all VMs from
"Selected" to "Available" by pressing the ``<<`` button.

To target a VM for backup, highlight it and move it into the "Selected"
column by pressing the ``>`` button. Select:

- the ``vault`` VM
- any customized VMs that you may wish to preserve.

You do not need to back up the ``sd-`` VMs.

Click "Next", and in "Backup destination," specify the VM and directory
corresponding to your storage medium's current mount point.

Set a strong, unique backup passphrase (7-word diceware), and ensure this
passphrase is stored securely outside SecureDrop Workstation.

.. note::
 This passphrase protects sensitive
 components of your SecureDrop instance, including the *Submission Private Key*.
 Ensure that it is a very strong password and is stored securely.

Uncheck "save backup profile," then proceed with the backup.

Qubes OS recommends verifying the integrity of the backup once the backup
completes. This can be done by using the Restore Backup GUI tool and selecting
"Verify backup integrity, but do not restore the data." For details, see the
`Qubes OS backup documentation <https://www.qubes-os.org/doc/backup-restore/>`_.

Restore
-------

Reinstall Qubes OS
~~~~~~~~~~~~~~~~~~

To restore SecureDrop Workstation, follow our
:doc:`pre-install tasks <../install/prepare>` to provision a Qubes OS system complete with
updated base templates.

Rename or delete redundant AppVMs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
By default, Qubes OS will create the AppVMs ``personal``, ``work``, ``untrusted``
and ``vault`` as part of the installation process. Rename or delete any
of these newly created AppVMs whose names conflict with the AppVMs you
intend to restore from a backup.

Example: If you restore only ``vault``, rename or delete the existing
``vault`` VM prior to restoring the backup. You can do so in
**Q > APPS > vault > Settings** (the VM must not be running).

Restore Backup
~~~~~~~~~~~~~~
Plug in your backup medium and unlock it as during the backup. By default
on a new system, your peripheral devices will be managed by a VM called
``sys-usb``.

Navigate to **Q ▸ ⚙️ > Qubes Tools ▸ Restore Backup**, and enter the
location of the backup file. You do not need to adjust the default Restore
options, unless you have made customizations to the backup. Enter the
decryption/verification passphrase, and proceed to restoring the available
qubes (which should include the ``vault`` VM).

Reinstall SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you do not already have a ``work`` VM, create it with default networking settings:

  .. code-block:: sh

    qvm-create -l blue work

Then, :ref:`download and verify <download_rpm>` the SecureDrop Workstation
.rpm to the ``work`` VM and copy it to ``dom0``.

Once you have a valid .rpm file in ``dom0``, install the .rpm by running:

  .. code-block:: sh

    sudo dnf install securedrop-workstation.rpm

Retrieve the previous SecureDrop Workstation configuration from the ``vault``
VM:

  .. code-block:: sh

    qvm-run --pass-io vault "cat QubesIncoming/dom0/sd-journalist.sec" > /tmp/sd-journalist.sec
    qvm-run --pass-io vault "cat QubesIncoming/dom0/config.json" > /tmp/config.json

Optionally, inspect each file before proceeding. The first
file should be an ASCII-armored GPG private key file. The second file should
follow the format of the `example configuration file <https://raw.githubusercontent.com/freedomofpress/securedrop-workstation/main/files/config.json.example>`_,
with values for its fields (e.g., ``hostname``, ``submission_key_fpr``) specific to
your configuration. The file may be formatted in a single line without whitespace.

Copy both files into place:

  .. code-block:: sh

    sudo cp /tmp/{sd-journalist.sec,config.json} /usr/share/securedrop-workstation-dom0-config/

Verify that the configuration is valid:

  .. code-block:: sh

    sdw-admin --validate

If the above command does not produce any errors, the configuration is valid,
and you may remove the configuration files from the ``vault`` VM:

  .. code-block:: sh

    qvm-run vault "rm QubesIncoming/dom0/{config.json,sd-journalist.sec}"

Finally, reinstall SecureDrop Workstation:

  .. code-block:: sh

    sdw-admin --apply
