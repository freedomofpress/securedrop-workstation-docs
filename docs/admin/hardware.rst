
Recommended hardware
====================

.. include:: ../includes/top-warning.rst

Qubes OS hardware requirements
------------------------------

In order to install and use SecureDrop Workstation, you will need a Qubes-Compatible computer with the following specifications:

- 64-bit Intel or AMD processor with virtualization support
- a minimum of 16GB RAM (32GB recommended for production use)
- sufficient disk space for the Qubes OS base install and SecureDrop Workstation VMs (a 128GB or greater SSD is recommended)

More information on hardware compatibility can be found on the `Qubes OS System Requirements <https://www.qubes-os.org/doc/system-requirements/>`_ page, and information on specific systems can be found via the `hardware compatibility list <https://www.qubes-os.org/hcl/>`_.

In order to print submissions, a supported non-networked printer is required. Supported models currently include:

- Brother HL-L2320D
- HP LaserJet Pro M404n

More printer options will be added in future releases.

Lenovo T series Laptops
-----------------------

Lenovo ThinkPad T490 (with 8th generation Intel Core processor)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The Thinkpad T490 **with an 8th generation Intel Core processor** is a recommended option for the SecureDrop Workstation. If you plan to use it, you should follow the instructions below to ensure that the BIOS is up to date and adequately configured before proceeding with the installation.


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


``sys-net`` should now start, and network devices will be functional. This change is only required once on first install.

.. |screenshot_sys_net_pci_reset| image:: ../images/screenshot_sys_net_pci_reset.png

Lenovo ThinkPad T480
~~~~~~~~~~~~~~~~~~~~
The ThinkPad T480 is also a recommended option for SecureDrop Workstation, as it is being used by the core team for development and testing. If you plan to use it, you should follow the instructions below to ensure that the BIOS is up to date and adequately configured before proceeding with the installation:

.. _t480_bios:

Upgrading the BIOS (T480/T490)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The instructions below assume the use of a Linux-based computer for the creation of a BIOS upgrade USB. To upgrade the BIOS:

- Locate the machine type of the T480/T490 - it be found via the ``Main`` tab in Thinkpad Setup (accessed by pressing **Enter** on startup). For recent T480s, it will be a string like `20L5` or `20L6`.
- Visit `<https://support.lenovo.com>`_ in the Linux-based computer. Type the machine type found above into the search bar, then press **Enter**.
- In the T480 Product Home page, select **Drivers And Software** and choose **BIOS/UEFI**.
- Expand the **BIOS Update** listing and download the **BIOS Update (Bootable CD)** file.

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

- Plug the USB into the T480 and boot it, pressing **F12** on startup. Select the USB's listing in the boot menu.

- Follow the on-screen instructions to update the BIOS, including any mandatory reboots. Note that the instructions may refer to an update CD instead of your update USB.

USB-C ports
~~~~~~~~~~~
If you intend to use USB-C ports, please note that our recommended BIOS settings will disable dual USB-C/Thunderbolt ports (recognizable by the Thunderbolt logo next to the port). The T480 includes two USB-C ports, `specified <https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-t-series/ThinkPad-T480/p/22TP2TT4800>`__ as follows:

- 1 x USB 3.1 Gen 1 Type-C (Power Delivery, DisplayPort, Data transfer)
- 1 x USB 3.1 Gen 2 Type-C / Intel Thunderbolt 3 (Power Delivery, DisplayPort, Data transfer)

The first of these ports will continue to function as a USB-C port. After disabling Thunderbolt, the second port can no longer be used for Thunderbolt or for USB-C data transfer, but it can still be used for power delivery (i.e. to plug in your AC adapter). If you are unsure about the features of your laptop's USB-C ports, or if you are using a different make or model, please consult the technical specifications of your laptop for further information.
