Upgrading to Qubes 4.3
======================

Qubes 4.2 reaches end-of-life on June 21, 2026. SecureDrop Workstation users
have until then to perform an in-place upgrade to Qubes 4.3. After that date, 
in-place upgrades will no longer be supported, and administrators will need to
:doc:`backup <backup>` their existing SecureDrop Workstation installation, 
perform a a clean installation of Qubes 4.3, re-provision SecureDrop Workstation
from scratch, and then restore from the backup.

Qubes 4.3 enables a host of new features that will improve the journalist experience
and increase overall security. These include preloaded disposable VMs, which make it
faster to open files, the ability to persistent specific directories within a VM,
and a new devices API that allows SecureDrop to prevent journalists from
accidentally attaching USB devices to a VM that could compromise the security of
the workstation.

For more details, please see `our blog post <https://securedrop.org/news/securedrop-workstation-1_7_0-released/>`_
describing some of these new features.

You can also read the `Qubes 4.3 release notes. <https://doc.qubes-os.org/en/latest/developer/releases/4_3/release-notes.html/>`_

Planning for the upgrade
------------------------

Upgrading to Qubes 4.3 is a multi-step process, which MUST be completed in full,
in order. Only items marked optional can be skipped.

We recommend blocking 4-6 hours to complete the upgrade.

We also suggest reaching out to `SecureDrop support via Signal <https://securedrop.org/help/>`_
to schedule a support window to make sure we are available to assist with any questions
or issues you encounter during your upgrade.

In addition to the Workstation device you wish to upgrade, you will need:

* a `LUKS-encrypted <https://workstation.securedrop.org/en/stable/admin/reference/provisioning_usb.html>`_ 
  USB or LUKS-encrypted external hard drive (of sufficient size to store a backup copy of your Inbox database)
* (optional) an Ethernet cable and/or Qubes-compatible Ethernet adapter

Once you have these materials, you may begin stepping through
the upgrade process outlined below.

Pre-requisite Tasks
-------------------

Connect your laptop to AC power
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The upgrade process takes several hours, and losing power in the middle of the
upgrade could result in a broken system that would require a reinstall.

Please make certain your laptop is plugged into a charger before continuing.

Install all available pre-flight updates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, you must make sure that you have all available updates
(including the Fedora 43 template that is required for a 
successful upgrade)

From a ``dom0`` Terminal opened via |qubes_menu| **▸** |qubes_menu_gear| **▸ Other ▸ Xfce Terminal**, run:

.. code-block:: sh

   sdw-update --skip-delta 0
   
And step through the standard SecureDrop pre-flight updater. If SecureDrop
Inbox opens at the end, please close it and continue.

Perform a full backup
~~~~~~~~~~~~~~~~~~~~~

Although we have thoroughly tested the upgrade process, due to the inherently
risky nature of an operating system upgrade, we very strongly suggest making
sure you have a backup of your sensitive key material and SecureDrop Inbox
database prior to upgrading.

Please follow the procedure outlined in our :doc:`backup guide <backup>`,
then return here to continue the upgrade.

.. warning:

   If you have any additional data or customizations, you will need to make
   certain to back those up as well.

Connect to Ethernet (optional)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If your laptop has a supported built-in Ethernet port, we recommend that you
connect via Ethernet and establish a hard-wired connection before continuing 
with the upgrade. A significant amount of data must be downloaded during the
upgrade, and using Ethernet can help make the experience faster and smoother.

Perform additional cleanup (optional, recommended)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before you proceed with the upgrade to Qubes 4.3, it's recommended to perform
some system cleanup that falls outside of the scope of what the SecureDrop 
Workstation typically manages.

If you're less familiar with Qubes, or if you have your own customizations and
feel comfortable managing them independently, you may skip this step.

Remove deprecated VMs and templates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
The following templates and disposables should be removed, as they are no longer
required and no longer receive security updates:

* ``fedora-40-dvm``
* ``fedora-41-dvm``
* ``fedora-40-xfce``
* ``fedora-41-xfce``
* ``fedora-42-xfce``

You may do so by using the `Qube Manager <https://doc.qubes-os.org/en/latest/introduction/getting-started.html#qube-manager>`_.

For any remaining Fedora-based VMs, you may need to switch their template
to ``fedora-43-xfce``.

Remove Whonix 17
^^^^^^^^^^^^^^^^^^

Whonix is no longer necessary for the SecureDrop Workstation.

If you still have Whonix 17 installed, and have no other use-case for it, you
should remove it. We recommend you remove any of the following VMs:

* ``whonix-workstation-17``
* ``whonix-gateway-17``
* ``anon-whonix``
* ``sys-whonix``
* ``whonix-workstation-17-dvm``

If you do have a need for Whonix, you should `manually upgrade <https://www.whonix.org/wiki/Release_Upgrade_17_to_18>`_ to version 18
once you have upgraded to Qubes 4.3.

You should not continue to use any Whonix 17 VMs, as they will not receive
security updates.

Upgrade to Qubes 4.3
--------------------

After the backup and any other desired prerequisite steps are complete, 
you can move forward with the two-part upgrade process.

You may see a reference to "stages" during the upgrade. The initial three stages happen
prior to the first reboot. The last three stages happen after the first reboot.
We will not be referring to specific stages in the instructions below,
but if you are interested in the technical details about each stage, please refer
to `Qubes documentation for the Qubes 4.3 upgrade. <https://doc.qubes-os.org/en/latest/user/downloading-installing-upgrading/upgrade/4_3.html#how-to-upgrade-from-qubes-4-2-to-qubes-4-3-in-place>`_

Begin the Qubes 4.3 upgrade from the ``dom0`` Terminal by running:

.. code-block:: sh

   sudo qubes-dom0-update -y qubes-dist-upgrade

   sudo qubes-dist-upgrade --releasever 4.3 -y --all-pre-reboot
   
If you encounter any errors with the above commands, please stop and contact support.
Note that the commands may take a couple of hours to complete and may appear to hang at times.

If you do not encounter any errors, please **reboot your SecureDrop Workstation when prompted**.

Once you have logged back in, verify that you still have an active WiFi or 
Ethernet connection, then continue by running:

.. code-block:: sh

   sudo qubes-dist-upgrade --releasever 4.3 -y --all-post-reboot
   
   sdw-admin --apply

After stepping through the SecureDrop pre-flight updater, go ahead and reboot your
SecureDrop Workstation one last time.

After the upgrade
~~~~~~~~~~~~~~~~~

After you log back in, your upgrade will be complete, and you can begin using SecureDrop
Inbox again. You may have to re-connect to your WiFi.

You can confirm you are on version 4.3 of Qubes via **Qube Manager ▸ About ▸ Qubes OS**

Opening documents within the SecureDrop Inbox will now be much faster!

.. |qubes_menu| image:: ../../images/qubes_menu.png
  :alt: Qubes Application menu
.. |qubes_menu_gear| image:: ../../images/qubes_menu_gear.png
  :alt: System Tools 
