Upgrading to Fedora 36
======================

.. include:: ../includes/top-warning.rst

Why do I need to upgrade?
-------------------------

SecureDrop Workstation makes use of several Fedora-based VMs which are part of
a Qubes installation by default, including ``sys-firewall``, ``sys-net``, ``sys-
usb``, ``work``, and ``vault`` . In Qubes 4.1.0, these VMs are based on a
Fedora 34 template, which reached end-of-life on June 7, 2022.

If you are provisioning SecureDrop Workstation for the first time, you will need
to update your Fedora template manually to Fedora 36 *before* installing
SecureDrop Workstation.

If you are an existing SecureDrop Workstation user, SecureDrop Workstation
will install the template automatically when updates are applied, but you
should also :ref:`manually configure <configure_vms>` VMs not managed by
SecureDrop Workstation to use the Fedora 36 template.

Install Fedora-36 template
--------------------------

In a ``dom0`` terminal (**Qubes Application Menu > Terminal Emulator**), type
the following to download the Fedora 36 template:

.. code:: sh

   sudo qvm-template install fedora-36

You will see some information from the template manager, including a progress
bar.

When the download has concluded, you will be prompted to install the package.
Type ``y`` to proceed with the installation.


Update the Fedora-36 template
-----------------------------
Once the template installation is complete, update the template using the Qubes
Updater. Click **Q > Qubes Tools > Qubes Update** in the application menu.
Click the checkbox "Enable updates for qubes without known updates" option,
and click the checkbox next to ``fedora-36``. Click **Next** and wait for
any available updates to be downloaded and applied.

.. _configure_vms:

Configure VMs to use the new template
-------------------------------------
To apply the template to VMs that currently use an older version, open the
Qube Manager via **Q > Qubes Tools > Qube Manager**. All VMs will be visible at
a glance; to change a VM's settings, right-click it and select **Qube Settings**.

In the Qube Settings window, select ``fedora-36`` from the drop-down menu
beside **Template**, then click **OK.**

|screenshot_qsettings_fedora32|

You should perform this process for:

  - ``work``
  - ``vault``
  - ``sys-net``
  - ``default-mgmt-dvm``.

Create a new disposable VM template based on Fedora 36 by running
the following commands in ``dom0``:

.. code:: sh

  qvm-create -l red -t fedora-36 fedora-36-dvm
  qvm-prefs fedora-36-dvm template_for_dispvms True
  qvm-features fedora-36-dvm appmenus-dispvm 1
  qubes-prefs default-dispvm fedora-36-dvm

Now, switch the templates for ``sys-usb`` and ``sys-firewall`` to
``fedora-36-dvm`` using the same process that you used above.

Reboot the system to ensure the changes take effect. Alternatively, you can
restart only the VMs you have updated. If you get a ``sys-whonix`` prompt asking how you want to connect to the Tor network, select the "Connect" option, which allows a direct connection to the Tor network.

.. tip::

   You can also use the **Qubes Template Manager** (also in **Q > Qubes Tools**)
   to make template changes. However, note that it will not allow you to make
   template changes for VMs that are currently running, so you may have to
   manually shut down VMs in the correct order to do so.

.. |screenshot_qsettings_fedora32| image:: ../images/screenshot_qsettings_fedora32.png
  :width: 100%

Getting Support
---------------

.. include:: ../includes/getting_support.rst
