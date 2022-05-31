Installing and Configuring SecureDrop Workstation
=================================================
.. include:: ../includes/top-warning.rst

Overview
--------

SecureDrop Workstation must be installed on a system running Qubes OS. The installation and configuration process should take between 4 and 6 hours, including time spent waiting for downloads and updates. At a high level, the tasks to be performed are as follows:

Pre-install tasks:
~~~~~~~~~~~~~~~~~~

#. Verify the SecureDrop server configuration
#. Apply BIOS updates and check settings
#. Download and verify Qubes OS
#. Install Qubes OS
#. Apply updates to system templates
#. Install Fedora 35 base template

Install tasks:
~~~~~~~~~~~~~~

#. Copy the submission key
#. Copy *Journalist Interface* details
#. Copy SecureDrop login credentials
#. Download and install SecureDrop Workstation
#. Configure SecureDrop Workstation
#. Test the Workstation


Prerequisites
-------------
In order to install SecureDrop Workstation and configure it to use an existing SecureDrop instance, you will need the following:

- A Qubes-compatible computer with at least 16GB of RAM (32 GB is recommended). SecureDrop Workstation has mainly been tested against Lenovo 6th-gen T480 and X1 models - see Qubes' `Hardware Compatibility List <https://www.qubes-os.org/hcl/>`_ and the SecureDrop Workstation :doc:`hardware` page for more options .
- Qubes installation medium - this guide assumes the use of a USB 3.0 stick. Qubes may also be installed via optical media, which may make more sense depending on your `security concerns <https://www.qubes-os.org/doc/install-security/>`_.

  .. note:: A USB stick with a Type-A connector is recommended, as USB-C ports may be disabled on your computer when the BIOS settings detailed below are applied.

- The SecureDrop instance's *Admin Workstation* and Secure Viewing Station (SVS) USBs, and the full GPG fingerprint of the submission key.
- (Optional, for a single-user workstation) The *Journalist Workstation* USB for the intended user of this workstation, if you want to import their SecureDrop login credentials into the workstation's password manager.
- The passphrases required to unlock the persistent volumes on each of these USB drives.

- A working computer (Linux is recommended and assumed in this guide) to use for verification and creation of the Qubes installation medium.

  .. note:: A Tails USB can be used to perform the tasks below, but due to the size of the Qubes installation ISO, it may make sense to download it on another computer rather than via Tor, and then to use a USB stick to transfer it to Tails for verification and creation of the installation medium.

- A password manager or other system to generate and store strong passphrases for Qubes full disk encryption (FDE) and user accounts.

A basic knowledge of the Qubes OS is helpful.


Pre-install tasks
-----------------

Rotate legacy passphrases
~~~~~~~~~~~~~~~~~~~~~~~~~
To ensure that all passphrases meet the security requirements of the system, you must rotate the passphrases of any *Journalist Interface* users whose accounts were set up on or before September 12, 2017.

To verify when users were added to the system:

- Log into the *Journalist Interface* with an admin account.
- Click the **Admin** link in the top right.
- Review the **Created** column in the list of users.

To rotate passphrases for accounts, please see the `instructions <https://docs.securedrop.org/en/stable/admin.html#passphrases-and-two-factor-resets>`_ in the SecureDrop Admin Guide.

Apply BIOS updates and check settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Before beginning the Qubes installation, make sure that your Qubes-compatible computer's BIOS is updated to the latest available version. If you're using one of the recommended ThinkPad T-series models, see the section on :ref:`thinkpad_t_series`. The process will be different for other makes and models, and can usually be found on their respective support sites.

Once the BIOS is up-to-date, boot into the BIOS setup utility and update its settings. Note that not all BIOS versions will support the items listed, but if available following changes are recommended:

- Ensure the internal clock is correct.
- Set a password to access the BIOS (and record the password in your password manager).
- Disable BIOS downgrades.
- Enable Data Execution Prevention.
- Enable virtualization support (required for Qubes OS).
  - for Intel-based devices, **Intel VT-d** and **Intel VT-x** should be enabled
  - for AMD-based devices, **AMD-VI** and **AMD-V** should be enabled
- Disable unnecessary I/O options such as Wireless WAN and  Bluetooth.
- Disable unnecessary network options such as Wake-on-LAN and UEFI network stacks.
- Disable Thunderbolt ports, or any other ports that allow Direct Memory Access (DMA).
- Enable any physical tamper detection options.
- Disable Computrace.
- Disable SecureBoot.

If the Qubes hardware compatibility list entry for your computer recommends the use of Legacy Mode for boot, change that setting in the BIOS as well.

Download and verify Qubes OS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. note:: Qubes OS recently released version ``4.1``, which is not yet supported by SecureDrop Workstation. While we are working on a compatible release, please make sure to download and install Qubes OS ``4.0.4``.

On the working computer, download the Qubes OS ISO for version ``4.0.4`` from `https://www.qubes-os.org/downloads/ <https://www.qubes-os.org/downloads/#qubes-release-4-0-4>`_. The ISO is 4.5GB approximately, and may take some time to download based on the speed of your Internet connection.

Follow the linked instructions to `verify the ISO <https://www.qubes-os.org/security/verifying-signatures/#how-to-verify-detached-pgp-signatures-on-qubes-isos>`_.

Once you've verified the ISO, copy it to your installation medium - for example, if using Linux and a USB stick, using the command:

.. code-block:: sh

  sudo dd if=Qubes-R4.0.4-x86_64.iso of=/dev/sdX bs=1048576 && sync

where ``if`` is set to the path to your downloaded ISO file and ``of`` is set to
the block device corresponding to your USB stick. Note that any data on the USB stick will be overwritten.

.. caution:: Make sure to verify that you have the correct device name using, for example, the ``lsblk`` command. You should write to the full device (eg. ``/dev/sdc``) rather than to a partition (eg. ``/dev/sdc1``).


Install Qubes OS (estimated wait time: 30-45 minutes)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To begin the Qubes installation, connect the Qubes install USB to your target computer and boot from it. You may need to bring up a boot menu at startup to do so - on Lenovo laptops, for example, you can do so by pressing **F12** on boot.

Follow the `installation documentation <https://www.qubes-os.org/doc/installation-guide/>`_ to install Qubes on your computer, ensuring that you:

- Use all available storage space for the installation (as the computer should be dedicated to SecureDrop Workstation).
- Set a strong FDE passphrase - a 6-word Diceware passphrase is recommended.
- Create an administrative account named ``user`` with a strong password.

  .. note:: Qubes is not intended to have multiple user accounts, so this account name and password will be shared by all SecureDrop Workstation users. The password will be required to log in and unlock the screen during sessions - choosing something strong but memorable and easily typed is recommended!

Once the installation is complete, you will be prompted to reboot into Qubes. Reboot, removing the install USB when the computer restarts.

You will be prompted to enter the FDE passphrase set during installation.

.. note:: On first booting into a Qubes OS 4.0.4 installation, you may be prompted to enter the FDE passphrase at a command-line prompt rather than via the GUI. The next system update will restore the GUI prompt.

After the disk is unlocked and Qubes starts, you will be prompted to complete the initial setup. Click the Qubes OS icon, then accept the default options and click **Done**. Finally, click **Finish Configuration** to set up the default system TemplateVMs and AppVMs.

Once the initial setup is complete, the login dialog will be displayed. Log in using the username and password set during installation.

Apply updates to system templates (estimated wait time: 45-60 minutes)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before installing SecureDrop Workstation, you must set up network and Tor access, then update the system VMs:

- After logging in, use the network manager widget in the upper-right panel to configure your network connection.

- Next, configure Tor by selecting the Qubes menu (the **Q** icon in the upper left corner) and selecting **Service: sys-whonix > sys-whonix: Anon Connection Wizard**. In most cases, choosing the default **Connect** option is best. Click **Next**, then **Next** again. Then, if Tor connects successfully, click **Finish**. If Tor fails to connect, make sure your network conection is up and does not filter Tor connections, then try again.

  .. note:: If Tor connections are blocked on your network, you may need to configure Tor to use bridges in order to get a connection. For more information, see the `Anon Connection Wizard <https://www.whonix.org/wiki/Anon_Connection_Wizard>`_ documentation.

- Once Tor has connected, select **Q > System Tools > Qubes Update** to update the system VMs. in the ``[Dom0] Qubes Updater`` window, first check ``Enable updates for qubes without known available updates``, then check all entries in the list above. Then, click **Next**. The system's VMs will be updated sequentially - this may take some time. When the updates are complete, click **Finish**.

Install Fedora 35 template
~~~~~~~~~~~~~~~~~~~~~~~~~~

See :doc:`upgrading_fedora`.

Install Whonix 16
~~~~~~~~~~~~~~~~~

Qubes 4.0.4 ships with Whonix 15, which reached end-of-life on November 14, 2021.  SecureDrop Workstation will install Whonix 16 for its own use.  However, if you see errors while updating the ``whonix-*-15`` templates, follow the `Whonix instructions for installing Whonix 16 <https://www.whonix.org/wiki/Qubes/Install#Installation>`_, then rerun the Qubes Updater as described above.

Install tasks
-------------

Copy the submission key
~~~~~~~~~~~~~~~~~~~~~~~

In order to decrypt submissions, your SecureDrop Workstation will need a copy of the secret key from your SecureDrop instance's SVS. To protect this key and preserve the air gap, you will need to connect the SVS USB to a Qubes VM with no network access, and copy it from there to ``dom0``. Note that you cannot directly copy and paste to the ``dom0`` VM from another VM - instead, follow the steps below to copy the file into ``dom0``:

- First, use the network manager widget in the upper right panel to disable your network connection. These instructions refer to the ``vault`` VM, which has no network access by default, but if the SVS USB is attached to another VM by mistake, this will offer some protection against exfiltration.

- Next, choose **Q > Domain: vault > vault: Files** to open the file manager in the ``vault`` VM.

- Connect the SVS USB to a USB port on the Qubes computer, then use the devices widget in the upper right panel to attach it to the ``vault`` VM. There will be 3 listings for the USB in the widget: one for the base USB, one for the Tails partition on the USB, labeled ``Tails``, and a 3rd unlabeled listing, for the persistent volume. Choose the third listing.

  |Attach TailsData|

- In the the ``vault`` file manager, select **+ Other Locations**, then click the persistent volume's listing in the right panel. It will be named ``N GB encrypted``, where N is the size of the persistent volume. Enter the SVS persistent volume passphrase to unlock and mount it.

  |Unlock TailsData|

- Open a ``dom0`` terminal via **Q > Terminal Emulator**, and run the following command to list the SVS submission key details, including its fingerprint:

  .. code-block:: sh

    qvm-run --pass-io vault \
      "gpg --homedir /run/media/user/TailsData/gnupg -K --fingerprint"

- Next, run the comand:

  .. code-block:: sh

    qvm-run --pass-io vault \
      "gpg --homedir /run/media/user/TailsData/gnupg --export-secret-keys --armor <SVSFingerprint>" \
      > /tmp/sd-journalist.sec

  where ``<SVSFingerprint>`` is the submission key fingerprint, typed as a single unit without whitespace. This will copy the submission key in ASCII format to a temporary file in dom0, ``/tmp/sd-journalist.sec``.

- Verify the that the file starts with ``-----BEGIN PGP PRIVATE KEY BLOCK-----`` using the command:

  .. code-block:: sh

    head -n 1 /tmp/sd-journalist.sec

- In the ``vault`` file manager, select **+ Other Locations** and eject the TailsData volume, then disconnect the SVS USB.


.. _copy_journalist:

Copy *Journalist Interface* details
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SecureDrop Workstation connects to your SecureDrop instance's API via the *Journalist Interface*. In order to do so, it will need the *Journalist Interface* address and authentication info. As the clipboard from another VM cannot be copied into ``dom0`` directly, follow these steps to copy the file into place:

- Locate an *Admin Workstation* or *Journalist Workstation* USB drive. Both hold the address and authentication info for the *Journalist Interface*; if you also want to copy the journalist user's password database, use the *Journalist Workstation* USB drive.

- Connect the USB drive to a USB port on the Qubes computer, then use the devices widget in the upper right panel to attach it to the ``vault`` VM. There will be 3 listings for the USB in the widget: one for the base USB, one for the Tails partition on the USB, labeled ``Tails``, and a 3rd unlabeled listing, for the persistent volume. Choose the third listing.

- In the the ``vault`` file manager, select **+ Other Locations**, then click the persistent volume's listing in the right panel. It will be named ```N GB encrypted``, where N is the size of the persistent volume. Enter the persistent volume passphrase to unlock and mount it.

- Copy the *Journalist Interface* configuration file to ``dom0``. If your SecureDrop instance uses v3 onion services, use the following command:

  .. code-block:: sh

    qvm-run --pass-io vault \
      "cat /run/media/user/TailsData/Persistent/securedrop/install_files/ansible-base/app-journalist.auth_private" \
      > /tmp/journalist.txt

- Verify that the ``/tmp/journalist.txt`` file on ``dom0`` contains valid configuration information using the command ``cat /tmp/journalist.txt`` in the ``dom0`` terminal.

- If you used an *Admin Workstation* USB drive, or you don't intend to copy a password database to this workstation, safely disconnect the USB drive now. In the ``vault`` file manager, select **+ Other Locations** and eject the TailsData volume, then disconnect the USB drive.

Copy SecureDrop login credentials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Users of SecureDrop Workstation must enter their username, passphrase and two-factor code to connect with the SecureDrop server. You can manage these passphrases using the KeePassXC password manager in the ``vault`` VM. If this laptop will be used by more than one journalist, we recommend that you shut down the ``vault`` VM now (using the Qube widget in the upper right panel), skip this section, and use a smartphone password manager instead.

In order to set up KeePassXC for easy use:

- Add KeePassXC to the application menu by selecting it from the list of available apps in **Q > Domain: vault > vault: Qube Settings > Applications** and pressing the button labeled **>** (do not press the button labeled **>>**, which will add *all* applications to the menu).

- Launch KeePassXC via **Q > Domain: vault > vault: KeePassXC**. When prompted to enable automatic updates, decline. ``vault`` is networkless, so the built-in update check will fail; the app will be updated through system updates instead.

- Close the application.

.. important::

   The *Admin Workstation* password database contains sensitive credentials not required by journalist users. Make sure to copy the credentials from the *Journalist Workstation* USB.

In order to copy a journalist's login credentials:

- If a *Journalist Workstation* USB is not currently attached, connect it, attach it to the ``vault`` VM, open it in the file manager, and enter its encryption passphrase.

- Locate the password database. It should be in the ``Persistent`` directory, and will typically be named ``keepassx.kdbx`` or similar.

- Open a second ``vault`` file manager window (``Ctrl + N`` in the current window) and navigate to the **Home** directory.

- Drag and drop the password database to copy it.

- In the ``vault`` file manager, select **+ Other Locations** and eject the TailsData volume, then disconnect the *Journalist Workstation* USB. Close this file manager window.

- In the file manager window that displays the home directory, open the copy you made of the password database by double-clicking it.

- If the database is passwordless, KeePassXC may display a security warning when opening it. To preserve convenient passwordless access, you can protect the database using a key file, via **Database > Database settings > Security > Add additional protection > Add Key File > Generate**. This key file has to be selected when you open the database, but KeePassXC will remember the last selection.

- Inspect each section of the password database to ensure that it contains only the information required by the journalist user to log in.

- Close the application window and shut down the ``vault`` VM (using the Qube widget in the upper right panel).

.. _download_rpm:

Download and install SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With the key and configuration available in ``dom0``, you're ready to set up SecureDrop Workstation:

- First, re-enable the network connection using the network manager widget.

- Next, start a terminal in the network-attached ``work`` VM, via **Q > Domain:work > work: Terminal**.

.. note:: As the next steps include commands that must be typed exactly, you may want to open a browser in the ``work`` VM, open this documentation there, and copy-and-paste the commands below into your ``work`` terminal. Note that due to Qubes' default security settings you will *not* be able to paste commands into your ``dom0`` terminal. The ``work`` browser can be opened via **Q > Domain: work > work: Firefox**

- In the ``work`` terminal, run the following commands to download and add the SecureDrop signing key, which is needed to verify the SecureDrop Workstation package:

  .. code-block:: sh

    gpg --keyserver hkps://keys.openpgp.org --recv-key \
      "2359 E653 8C06 13E6 5295 5E6C 188E DD3B 7B22 E6A3"

    gpg --armor --export 2359E6538C0613E652955E6C188EDD3B7B22E6A3 \
      > securedrop-release-key.pub

    sudo rpmkeys --import securedrop-release-key.pub

- In the ``work`` terminal, open a text editor with escalated privileges (for example, with the command ``sudo gedit``) and create a file ``/etc/yum.repos.d/securedrop-temp.repo`` with the following contents:

  .. code-block:: none

    [securedrop-workstation-temporary]
    enabled=1
    baseurl=https://yum.securedrop.org/workstation/dom0/f25
    name=SecureDrop Workstation Qubes initial install bootstrap

- Download the SecureDrop Workstation config package to the curent working directory with the command:

  .. code-block:: sh

    dnf download securedrop-workstation-dom0-config

  Note the release version number in the filename, you'll need it below.

- Verify the package with the following command:

  .. code-block:: sh

    rpm -Kv securedrop-workstation-dom0-config-<versionNumber>-1.fc25.noarch.rpm

  where ``<versionNumber>`` is the release version number you noted above. The command output should match the following text:

  .. code-block:: none

    securedrop-workstation-dom0-config-<versionNumber>-1.fc25.noarch.rpm:
      Header V4 RSA/SHA512 Signature, key ID 7b22e6a3: OK
      Header SHA256 digest: OK
      Header SHA1 digest: OK
      Payload SHA256 digest: OK
      V4 RSA/SHA512 Signature, key ID 7b22e6a3: OK
      MD5 digest: OK


- If the package verification was successful, in the ``dom0`` terminal, run the following command to transfer the RPM package to dom0:

  .. code-block:: sh

    qvm-run --pass-io work \
      "cat /home/user/securedrop-workstation-dom0-config-<versionNumber>-1.fc25.noarch.rpm" \
      > securedrop-workstation.rpm

- Verify that the RPM was transferred correctly by running the following commands:

  - in the ``work`` terminal:

    .. code-block:: sh

      sha256sum securedrop-workstation-dom0-config-<versionNumber>-1.fc25.noarch.rpm

  - in the ``dom0`` terminal:

    .. code-block:: sh

      sha256sum securedrop-workstation.rpm

  If the hash output for both files matches, the RPM was transferred successfully.

- Install the RPM using the following command in the ``dom0`` terminal:

    .. code-block:: sh

      sudo dnf install securedrop-workstation.rpm

  When prompted, type **Y** and **Enter** to install the package.

- Shut down the ``work`` VM using the Qube widget in the top-right panel.

Configure SecureDrop Workstation (estimated wait time: 60-90 minutes)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before setting up the set of VMs used by SecureDrop Workstation, you must configure the *Journalist Interface* connection and submission key.

- To add the submission key, run the following command in the ``dom0`` terminal:

  .. code-block:: sh

    sudo cp /tmp/sd-journalist.sec /usr/share/securedrop-workstation-dom0-config/

- Your submission key has a unique fingerprint required for the configuration. Obtain the fingerprint by using this command:

  .. code-block:: sh

    gpg --with-fingerprint --with-colons /tmp/sd-journalist.sec

  The fingerprint will be on a line that starts with ``fpr``. For example, if the output included the line ``fpr:::::::::65A1B5FF195B56353CC63DFFCC40EF1228271441:``, the fingerprint would be the character sequence ``65A1B5FF195B56353CC63DFFCC40EF1228271441``.

- Next, create the SecureDrop Workstation configuration file:

  .. code-block:: sh

    cd /usr/share/securedrop-workstation-dom0-config
    sudo cp config.json.example config.json

- The ``config.json`` file must be updated with the correct values for your instance. Open it with root privileges in a text editor such as ``vi`` or ``nano`` and update the following fields' values:

  - **submission_key_fpr**: use the value of the submission key fingerprint as displayed above
  - **hidserv.hostname**: use the hostname of the *Journalist Interface*, including the ``.onion`` TLD
  - **hidserv.key**: use the private v3 onion service authorization key value
  - **environment**: use the value ``prod``

.. note::

   You can find the values for the **hidserv.*** fields in the ``/tmp/journalist.txt`` file that you created in ``dom0`` earlier.
   The file will be formatted as follows:

   .. code-block:: none

     ONIONADDRESS:descriptor:x25519:AUTHTOKEN

- Verify that the configuration is valid using the command below in the ``dom0`` terminal:

  .. code-block:: sh

    sdw-admin --validate

- Finally, in the ``dom0`` terminal, run the command:

  .. code-block:: sh

    sdw-admin --apply

This command will take a considerable amount of time and approximately 4GB of bandwidth, as it sets up multiple VMs and installs supporting packages. When the command finishes, reboot the machine to complete the installation. Your SecureDrop Workstation is finally ready to use!

Test the Workstation
~~~~~~~~~~~~~~~~~~~~

To start the SecureDrop Client, double-click the SecureDrop desktop icon that was set up by the previous command. The preflight updater will start and check for updates. The system should be up-to-date and no updates should be required, but if updates are available follow the instructions in the preflight updater to apply them.

Once the update check is complete, the SecureDrop Client will launch. Log in using an existing journalist account and verify that sources are listed and submissions can be downloaded, decrypted, and viewed.

.. _Password Management Section:

Enable password copy and paste
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you use KeePassXC in the ``vault`` VM to manage login credentials, you can enable the user to copy passwords to the SecureDrop Client using inter-VM copy and paste. While this is relatively safe, we recommend reviewing the section :doc:`Managing Clipboard Access <managing_clipboard>` of this guide, which goes into further detail on the security considerations for inter-VM copy and paste.

The password manager runs in the networkless ``vault`` VM, and the SecureDrop Client runs in the ``sd-app`` VM. To permit this one-directional clipboard use, issue the following command in ``dom0``:

.. code-block:: sh

   qvm-tags vault add sd-send-app-clipboard

Confirm that the tag was correctly applied using the ``ls`` subcommand:

.. code-block:: sh

   qvm-tags vault ls

To revoke this configuration change later or correct a typo, you can use the ``del`` subcommand, e.g.:

.. code-block:: sh

   qvm-tags vault del sd-send-app-clipboard

Troubleshooting installation errors
-----------------------------------

"Recurse failed: none of the specified sources were found"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
An error similar to the following may be displayed during the installation, after which the installation will fail:

.. code-block:: none

    ______ID: dom0-securedrop-launcher-directory
    Function: file.recurse
        Name: /opt/securedrop/launcher
      Result: False
     Comment: Recurse failed: none of the specified sources were found
     Started: 20:52:46.766870
    Duration: 2.371 ms
     Changes:

To clear this error, clear the Salt cache and resynchronize by running the following commands in a ``dom0`` terminal:

.. code-block:: sh

  sudo rm -rf /var/cache/salt
  sudo qubesctl saltutil.sync_all refresh=true

Then, run ``sdw-admin --apply`` again.

"Failed to return clean data"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An error similar to the following may be displayed during an installation or update:

.. code-block:: none

  sd-log:
        ----------
        _error:
            Failed to return clean data
        retcode:
            None
        stderr:
        stdout:
            deploy

This is a transient error that may affect any of the SecureDrop Workstation VMs. To clear it, run the installation command or update again.

"Temporary failure resolving"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Transient network issues may cause an installation to fail. To work around this, verify that you have a working Internet connection, and re-run the ``sdw-admin --apply`` command.

Uninstalling SecureDrop Workstation
-----------------------------------
To uninstall SecureDrop Workstation, open a ``dom0`` terminal and run the following command:

.. code-block:: sh

  sdw-admin --uninstall

This will remove all associated VMs and configuration details, and uninstall the ``dom0`` SecureDrop Workstation package.

The submission key and ``config.json`` file will still be present in ``dom0`` in ``/usr/share/securedrop-workstation-dom0-config``. To delete them, use the command:

.. code-block:: sh

   sudo shred /usr/share/securedrop-workstation-dom0-config/{config.json,sd-journalist.sec}

.. |Attach TailsData| image:: images/attach_usb.png
  :width: 100%
.. |Unlock Tailsdata| image:: images/unlock_tails_usb.png
  :width: 100%

Getting Support
---------------
.. include:: ../includes/getting_support.rst
