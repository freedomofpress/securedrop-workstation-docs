
Recommended hardware
====================

.. include:: ../includes/top-warning.rst

Qubes OS hardware requirements
------------------------------

In order to install and use SecureDrop Workstation, you will need a Qubes-Compatible computer with the following specifications:

- 64-bit Intel or AMD processor with virtualization support
- a minimum of 16GB RAM (32GB recommended for production use)
- sufficient disk space for the Qubes OS base install and SecureDrop Workstation VMs (a 128GB or greater SSD is recommended)

We recommend against a device that requires an external USB keyboard for security reasons.

More information on hardware compatibility can be found on the `Qubes OS System Requirements <https://www.qubes-os.org/doc/system-requirements/>`_ page, and information on specific systems can be found via the `hardware compatibility list <https://www.qubes-os.org/hcl/>`_.

In order to print submissions, a supported non-networked printer is required. We have tested and recommend the HP LaserJet Pro M404n. More printer options will be added in future releases.

.. _thinkpad_x1_series:

Lenovo X1 series laptops
------------------------

Lenovo ThinkPad X1 Carbon (10th-generation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The 10th-generation Thinkpad X1 Carbon **with a 12th-generation Intel Core processor** is a recommended option for the SecureDrop Workstation beginning with Qubes 4.1.  If you plan to use it:

- If your laptop has come with Ubuntu preinstalled, run its **Software Updater** twice as follows:

  #. to install software updates, especially for the ``fwupd`` package; and then
  #. to run ``fwupd`` to update the BIOS automatically.

  If **Software Updater** offers to run ``fwupd`` during step (1), decline until step (2), to make sure ``fwupd`` itself has received its latest security updates.

- Otherwise, follow the instructions below to ensure that the BIOS is up to date.

You'll need to have a USB-to-Ethernet adapter on hand in order to :ref:`apply Qubes updates <apply_dom0_updates>`, which will enable Wi-Fi and fix glitchy video rendering and cursor performance.

.. _thinkpad_t_series:

Lenovo T series laptops
-----------------------

Lenovo ThinkPad T14 (2nd-generation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The 2nd-generation ThinkPad T14 **with an 11th-generation Intel Core processor** is a recommended option for the SecureDrop Workstation beginning with Qubes 4.1. If you plan to use it:

- If your laptop has come with Ubuntu preinstalled, run its **Software Updater** twice as follows:

  #. to install software updates, especially for the ``fwupd`` package; and then
  #. to run ``fwupd`` to update the BIOS automatically.

  If **Software Updater** offers to run ``fwupd`` during step (1), decline until step (2), to make sure ``fwupd`` itself has received its latest security updates.

- Otherwise, follow the instructions below to ensure that the BIOS is up to date.

The Ethernet and Wi-Fi controllers may not work without one-time manual configuration, as documented in the following sections.

Ethernet controller
^^^^^^^^^^^^^^^^^^^
After Qubes starts for the first time, when ``sys-net`` fails to start, follow the instructions below for the :ref:`thinkpad_t490`, but only for the ``dom0:00_1f.6`` Ethernet device.

.. _thinkpad_t490:

Lenovo ThinkPad T490 (with 8th-generation Intel Core processor)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The Thinkpad T490 **with an 8th-generation Intel Core processor** is a recommended option for the SecureDrop Workstation. If you plan to use it, you should follow the instructions below to ensure that the BIOS is up to date and adequately configured before proceeding with the installation.


.. caution::

  The versions of the T490 with 10th generation Intel Core processors are at present **untested and unsupported**. The Workstation has been tested on models 20N2002AUS & 20N20046US.

Network devices (Ethernet and Wi-Fi) will not immediately work out of the box and require a one-time manual configuration on install. After Qubes starts for the first time, ``sys-net`` will fail to start:

|screenshot_sys_net_pci_reset|

Open a ``dom0`` terminal via **Q > Terminal Emulator**, and run the following command to list the devices connected to the ``sys-net`` VM.

.. code-block:: sh

  qvm-pci ls sys-net


This will return the two devices (Ethernet and WiFi) that are connected to ``sys-net``:

.. code-block:: sh

  BACKEND:DEVID  DESCRIPTION                                                            USED BY
  dom0:00_14.3   Network controller: Intel Corporation                                  sys-net
  dom0:00_1f.6   Ethernet controller: Intel Corporation Ethernet Connection (5) I219-V  sys-net


For both device IDs (e.g. ``dom0:00_1f.6`` and ``dom0:00_14.3``), you will need to detach and re-attach the device to ``sys-net``, then restart ``sys-net`` as follows:

.. code-block:: sh

  qvm-pci detach sys-net dom0:00_14.3
  qvm-pci detach sys-net dom0:00_1f.6
  qvm-pci attach sys-net --persistent --option no-strict-reset=True dom0:00_14.3
  qvm-pci attach sys-net --persistent --option no-strict-reset=True dom0:00_1f.6
  qvm-start sys-net


``sys-net`` should now start, and network devices will be functional. This change is only required once on first install.  See the `Qubes documentation of this issue <https://www.qubes-os.org/doc/pci-troubleshooting/#unable-to-reset-pci-device-errors>`_ for more information.

.. |screenshot_sys_net_pci_reset| image:: ../images/screenshot_sys_net_pci_reset.png

Lenovo ThinkPad T480
~~~~~~~~~~~~~~~~~~~~
The ThinkPad T480 is also a recommended option for SecureDrop Workstation, as it is being used by the core team for development and testing. If you plan to use it, you should follow the instructions below to ensure that the BIOS is up to date and adequately configured before proceeding with the installation:

.. _thinkpad_bios:

Upgrading the BIOS on ThinkPad models T480, T490, and T14
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The instructions below assume the use of a Linux-based computer for the creation of a BIOS upgrade USB. To upgrade the BIOS:

- Locate the ThinkPad's "machine type" in its BIOS setup program:

  #. Boot (or reboot) the ThinkPad and follow the prompts to enter setup, usually via the <Enter> and <F1> keys.
  #. On the **Main** tab, look for the **Machine Type Model**.  The first four characters, such as `20L5`, `20L6`, or `20S0`, are the machine type.

- Visit `<https://support.lenovo.com>`_ in the Linux-based computer. Type the machine type found above into the search bar, then press **Enter**.
- In the T480 Product Home page, select **Drivers And Software** and choose **BIOS/UEFI**.
- Download the file called either **BIOS Update (Bootable CD)** or **BIOS Update (Utility & Bootable CD)**.

.. note::
  A Tails USB can be used for the verification and conversion process described below, but the Lenovo support site blocks requests over Tor, preventing the ISO download. To work around this, either:

  - download the BIOS ISO on a different computer and transfer it to Tails using a USB stick, or
  - download the ISO in Tails using the Unsafe Browser as follows:

    - Start Tails with an administration password set and the Unsafe Browser enabled under "Additional Settings" on the Welcome Screen.
    - Open the Unsafe Browser: **Applications > Internet > Unsafe Browser** and find and download the ISO
    - Note the filename, as you'll need it for subsequent steps.
    - Leave the Unsafe Browser running, and open a terminal via **Applications > System Tools > Terminal**.
    - Copy the ISO to the desktop with the command:

      .. code-block:: sh

        sudo cp /var/lib/unsafe-browser/chroot/home/clearnet/Downloads/<fileName.iso> ~amnesia/Desktop

    - Fix the ISO file's ownership with the command:

      .. code-block:: sh

        sudo chown amnesia:amnesia ~amnesia/Desktop/<fileName.iso>

- Verify the checksum of the downloaded ISO file using the following command, comparing it against the checksum in the file listing above:

  .. code-block:: sh

    sha256sum /path/to/downloaded.iso

- Create a USB-bootable version of the ISO using the command:

  .. code-block:: sh

    geteltorito <path/to/CDISO> > usb-bios.iso

  .. note:: To install the ``geleltorito`` utility on Debian-based systems, use the command

    .. code-block:: sh

      sudo apt install genisoimage

    To install it on Fedora-based systems, use the command:

    .. code-block:: sh

      sudo dnf install geteltorito genisoimage

- Plug in a USB and check its device name with the ``lsblk`` command - use the root device name below, not a partition (eg. ``/dev/sdc`` instead of ``/dev/sdc1``).

- Write the BIOS update ISO to the USB using the following command:

  .. code-block:: sh

    sudo dd if=usb-bios.iso of=/dev/sdX bs=1M && sync

  where ``sdX`` is the device name verified above.

  .. caution::

    The ``dd`` command will wipe data on the targeted device. Make sure that you use the correct device name.

  Once complete, remove the USB.

- Plug the USB into the ThinkPad.

- Boot the ThinkPad and follow the prompts to enter its startup and boot menus, likely via the <Enter> and <F12> keys, respectively.

- Follow the on-screen instructions to update the BIOS, including any mandatory reboots. Note that the instructions may refer to an update CD instead of your update USB.

USB-C ports
~~~~~~~~~~~
If you intend to use USB-C ports, please note that our recommended BIOS settings will disable dual USB-C/Thunderbolt ports (recognizable by the Thunderbolt logo next to the port). The T480, for example, includes two USB-C ports, `specified <https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T480/ThinkPad_T480_Spec.PDF>`__ as follows:

- 1 x USB 3.1 Gen 1 Type-C (Power Delivery, DisplayPort, Data transfer)
- 1 x USB 3.1 Gen 2 Type-C / Intel Thunderbolt 3 (Power Delivery, DisplayPort, Data transfer)

The first of these ports will continue to function as a USB-C port. After disabling Thunderbolt, the second port can no longer be used for Thunderbolt or for USB-C data transfer, but it can still be used for power delivery (i.e. to plug in your AC adapter). If you are unsure about the features of your laptop's USB-C ports, or if you are using a different make or model, please consult the technical specifications of your laptop for further information.

