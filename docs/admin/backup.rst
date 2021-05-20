Backup and Restore
==================

.. include:: ../includes/top-warning.rst

QubesOS has a `backup utility <https://www.qubes-os.org/doc/backup-restore/>`_ 
that allows for backup and restoration of user-specified VMs. 

To perform backups, you will need:

 - an encrypted storage medium
 - a secure place to store backup credentials    

Backup 
------

Prepare files in ``dom0``
~~~~~~~~~~~~~~~~~~~~~~~~~

Files outside the ``dom0`` home folder aren't normally backed up by the 
Qubes backup tool. Preserve key configuration files by coping them to the 
home directory. 

In a ``dom0`` Terminal via **Q ▸ Terminal Emulator**:

  .. code-block:: sh

    mkdir ~/backup/
    cp -r /usr/share/securedrop-workstation-dom0-config/ ~/backup/

If you have customized :doc:`clipboard access <managing_clipboard>` 
to SecureDrop Workstation, or have made any other customizations 
involving RPC policies, back up related configuration files:   

  .. code-block:: sh

   mkdir -p ~/backup/etc/qubes
   mkdir ~/backup/etc/qubes-rpc
   cp -a /etc/qubes/* ~/backup/etc/qubes/
   cp -a /etc/qubes-rpc/* ~/backup/etc/qubes-rpc

Back up SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensure your storage medium is plugged in, attached to a VM, and mounted.
(LUKS-encrypted storage media may be attached to ``sd-usb``, or you may use a custom 
VM of your choosing, if you are relying on another form of encryption such as 
Veracrypt).

Navigate to **Q ▸ System Tools ▸ Backup Qubes**, and move all VMs from 
"Selected" to "Available" by pressing the ``<<`` button. 

To target a VM for backup, highlight it and move it into the "Selected" 
column by pressing the ``>`` button. Select the following VMs:

 - ``dom0``
 - ``vault``
 - any customized VMs that you wish to preserve.

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

QubesOS recommends verifying the integrity of the backup once the backup 
completes. This can be done by using the Restore Backup GUI tool and selecting
"Verify backup integrity, but do not restore the data." For details, see the 
`QubesOS backup documentation <https://www.qubes-os.org/doc/backup-restore/>`_.

Restore
-------

Reinstall QubesOS
~~~~~~~~~~~~~~~~~

To restore SecureDrop Workstation, follow our 
:doc:`pre-install tasks <install>` to provision a QubesOS system complete with
updated base templates.

.. note::
 If you backed up a number of custom VMs, during the installer, you may opt
 to un-select "create default application qubes (personal, work, untrusted, vault)".

Manage Unused VMs
~~~~~~~~~~~~~~~~~

If you installed all default application VMs, remove the ``vault`` VM, since we
will replace it with the version in our backup.

  .. code-block:: sh

   qvm-prefs --set vault installed_by_rpm False 
   qvm-remove vault

Restore Backup
~~~~~~~~~~~~~~

Plug in your backup medium and unlock it as during the backup. By default
on a new system, your peripheral devices will be managed by ``sys-usb``. 
(For non-LUKS-based encryption media, you will need to install and configure the
appropriate software, either in ``sys-usb`` or in another VM).

Navigate to **Q ▸ System Tools ▸ Restore Backup**, and enter the  
location of the backup file. You do not need to adjust the default Restore 
options, unless you have made customizations to the backup. Enter the
decryption/verification passphrase, and proceed to restore the backup.

Your ``vault`` VM will be restored. 

The contents of the previous ``dom0`` will be backed up to a folder in the 
new ``dom0`` home directory called ``home-restore-<timestamp>/dom0-home/user``.
In this guide we will refer to that location as ``$DOM0_BACKUP``.

Open a terminal via **Q ▸ Terminal Emulator**: 

  .. code-block:: sh

   cd $DOM0_BACKUP/backup
   cp -r securedrop-workstation-dom0-config/ /usr/share/

If you customized clipboard or RPC policies, you may inspect the files in
``backup/etc/qubes-rpc/`` and ``backup/etc/qubes/`` to ensure that the
configurations in those files are re-applied to your new instance. 

.. note::
 Proceed with caution if overwriting files in ``/etc/qubes/`` and 
 ``/etc/qubes-rpc/`` with their counterparts from your backup file, since this
 can have unintended consequences, in particular if there are configuration 
 differences between your old and new installation.   

Reinstall SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow the :doc:`installation instructions <install>` to download and verify
the SecureDrop Workstation rpm to a network-attached VM and copy it to ``dom0``.

.. note::
 If your installation is recent, your backup archive may contain the current
 version of the rpm, in which case you can skip the above steps and move
 straight to installing the rpm. 
 Use ``rpm -qi securedrop-workstation.rpm`` to compare the version with the
 latest version at ``https://yum.securedrop.org/workstation/dom0/f25/``    

Once you have a valid .rpm file in ``dom0``, install the .rpm by running:

  .. code-block:: sh

    sudo dnf install securedrop-workstation.rpm

Copy the previous SecureDrop Workstation configuration into place:

  .. code-block:: sh

    cp -r $DOM0_BACKUP/backup/usr/share/securedrop-workstation-dom0-config \
     /usr/share/

Verify that the configuration is valid:

  .. code-block:: sh

    sdw-admin --validate

Finally, reinstall SecureDrop Workstation:

  .. code-block:: sh

    sdw-admin --apply
