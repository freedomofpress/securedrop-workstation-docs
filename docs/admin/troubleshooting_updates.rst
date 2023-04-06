Troubleshooting system updates
==============================

.. include:: ../includes/top-warning.rst

After you log into Qubes, the SecureDrop Workstation
preflight updater will prompt you to check for available
system updates at least once per day.

If updates fail for any reason, the preflight updater will
not launch the SecureDrop Client application until the
underlying issue has been resolved. This is to ensure
that the system is in a secure state before you
interact with SecureDrop.

.. figure:: images/preflight_update_failed.png
   :alt: A screenshot of the preflight update window,
         displaying a failed update error message. The
         title reads "Security updates failed", and the
         message instructs the user to contact the administrator
         to correct the error. The SecureDrop client cannot
         be started until the error is corrected.

   The error displayed when the preflight updater
   does not successfully complete the update.

This guide offers troubleshooting steps for common
update issues.

Step 1: Locate the updater log
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The preflight updater runs in the ``dom0`` domain. It
writes its log to ``~/.securedrop_launcher/logs/launcher.log``.
Log files are rotated hourly; if you have started the updater
again since the error occurred, you may need to check the
previous log file.

In order to examine the most recent log file:

1. Open a terminal in ``dom0`` by clicking the Qubes menu
   icon in the upper left corner of your screen, and
   selecting **Terminal Emulator**.

2. Change to the ``~/.securedrop_launcher/logs/`` directory:

   ``cd ~/.securedrop_launcher/logs/``

3. Display the most recent log file:

   ``cat launcher.log``

In order to locate a previous log file in the same directory:

1. Locate the most recently modified log file.

   ``ls -t  launcher.log* | head -n 2``

2. Display the file that ends with a date and time stamp, e.g.:

   ``cat launcher.log.2023-01-01_10``

Step 2: Identify the cause(s) of the error
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If the updater has run to completion, you should see a result
line in the log file that looks similar to the following:

.. code-block:: none

  2023-03-30 20:12:11,821 - sd.sdw_updater_gui.UpdaterApp:71(upgrade_status)
  INFO: Signal: upgrade_status {
  'dom0': <UpdateStatus.UPDATES_OK: '0'>,
  'apply_dom0': <UpdateStatus.UPDATES_OK: '0'>,
  'fedora-37': <UpdateStatus.UPDATES_OK: '0'>,
  'sd-large-bullseye-template': <UpdateStatus.UPDATES_OK: '0'>,
  'whonix-gw-16': <UpdateStatus.UPDATES_FAILED: '3'>,
  'sd-small-bullseye-template': <UpdateStatus.UPDATES_OK: '0'>,
  'recommended_action': <UpdateStatus.UPDATES_FAILED: '3'>}

In this example, the ``whonix-gw-16`` VM has failed to update.
This is indicated by the text ``<UpdateStatus.UPDATES_FAILED: '3'>``.

It is possible that multiple steps have failed. Make note of any
of the individual steps that have failed, other than ``recommended_action``.

Step 3: Resolve the issue(s)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The resolution path will depend on which step(s) failed.
Note that ``dom0`` and ``apply_dom0`` are separate steps.


``dom0`` update failures
^^^^^^^^^^^^^^^^^^^^^^^^
1. Open a terminal in ``dom0`` by clicking the Qubes menu
   icon in the upper left corner of your screen, and
   selecting **Terminal Emulator**.

2. Perform an interactive ``dom0`` update by running the
   following command:

   ``sudo qubes-dom0-update``

3. Follow the prompts to resolve any issues. If you are
   unsure on how to resolve an error, please contact us
   for assistance.

4. Reboot the system. ``dom0`` updates are often
   security-sensitive, and may requrie a reboot to take
   effect.

``sd-*-template`` or ``whoix-gw-16`` update failures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. Click the Qubes menu and open a terminal in the impacted
   template. For example, if ``whonix-gw-16`` failed to
   update, select its entry in the Qubes menu and click
   **Terminal**. (Be sure not to confuse it with the
   similarly named ``whonix-ws-16`` template.)

2. Perform an interactive template update by running the
   the following commands:

   ``sudo apt update``

   ``sudo apt upgrade``

  The SecureDrop and Whonix templates are based on Debian
  GNU/Linux. The ``apt update`` comand will ensure the package
  index is up-to-date, and the ``apt upgrade`` comand will
  apply updates.

3. Follow the prompts to resolve any issues. If you are
   unsure on how to resolve an error, please contact us
   or assistance.

``fedora-37`` update failures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. Click the Qubes menu and open a terminal in the ``fedora-37``
   template.

2. Perform an interactive template update by running the following
   command:

   ``sudo dnf update``

3. Follow the prompts to resolve any issues. If you are
   unsure on how to resolve an error, please contact us
   or assistance.

``apply_dom0`` update failures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``apply_dom0`` step applies any necessary configuration
changes to the SecureDrop Workstation. If this step fails,
this may indicate a misconfiguration, or it could be a result
of download failures during the operation.

We recommend first re-running the updater by double-clicking
the SecureDrop desktop icon. This may resolve transient network
issues.

If this does not resolve the issue:

1. Locate the ``launcher-detail.log`` file in the same directory
   as the ``launcher.log`` file. This file contains more detailed
   information about the ``apply_dom0`` step.

   Like the ``launcher.log`` file, this file is rotated hourly.

2. Copy this file to a networked VM by using the ``qvm-copy-to-vm``
   command. For example, to copy the file to the ``work`` VM:

   ``qvm-copy-to-vm work ~/.securedrop_launcher/logs/launcher-detail.log``

3. The file can now be found in ``~/QubesIncoming/dom0/`` in the
   ``work`` VM.

   Send us the file through a secure channel, such as our support portal.
   We will provide further instructions.

Step 4: Restart the updater
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Click the SecureDrop desktop icon to restart the updater.
If all issues have been resolved, the updater should run to
completion and display a success message. If the issue
persists, please contact us for assistance.