Upgrading to Fedora 31
======================

.. include:: ../includes/top-warning.rst

.. note:: This advisory was written in May 2020, and will be removed when a new
          version of Qubes that contains the Fedora 31 template is released.

Why do I need to upgrade?
-------------------------

SecureDrop Workstation makes use of several Fedora-based VMs which are part of
a Qubes installation by default, including ``sys-firewall``, ``sys-net``, ``sys-
usb``, ``work``, and ``vault`` . In Qubes 4.0.3, these VMs are based on a
Fedora 30 template.

As of May 26, 2020, Fedora 30 templates are end-of-life. If you are
provisioning SecureDrop Workstation for the first time, you will need to update
your Fedora template manually from Fedora 31 *before* installing SecureDrop
Workstation.

If you are an existing SecureDrop Workstation user, SecureDrop Workstation
will install the template automatically when updates are applied, but you
should also :ref:`manually configure <configure_vms>` VMs not managed by
SecureDrop Workstation to use the Fedora 31 template.

Install Fedora-31 template
--------------------------

In a ``dom0`` terminal (**Qubes Application Menu > Terminal Emulator**), type
the following to download the Fedora 31 template:

.. code:: sh

   sudo qubes-dom0-update qubes-template-fedora-31

You will see some information from the package manager, including a progress
bar.

When the download has concluded, you will be prompted to install the package.
Type ``y`` to proceed with the installation.

Update the Fedora-31 template
-----------------------------

Once the template is installed, update by navigating to **System Tools > Qubes
Update**, enabling the "Enable updates for qubes without known updates" option,
and selecting ``fedora-31``.

.. _configure_vms:

Configure VMs to use the new template
-------------------------------------

Update a VM's base template via the **Qubes Application Menu > Qube Manager**.
All VMs will be visible at a glance; to change a VM's settings, right-click it
and select **Qube Settings**.

In the Qube Settings window, select ``fedora-31`` from the drop-down menu
beside **Template**, then click **OK.** Note that, if the VM is running, the
change will only take effect once it has been shut down and rebooted.

|screenshot_qsettings_fedora31|

You should perform this process for:

  - ``work``
  - ``vault``
  - ``sys-net``
  - ``sys-usb``
  - ``sys-firewall``.

Existing SecureDrop Workstation users may perform this process for ``work`` and
``vault`` only, as the other VMs will be updated by SecureDrop Workstation.

.. |screenshot_qsettings_fedora31| image:: ../images/screenshot_qsettings_fedora31.png

Getting Support
---------------

.. include:: ../includes/getting_support.rst
