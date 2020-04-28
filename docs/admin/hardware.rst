
Recommended hardware
====================

.. include:: ../includes/top-warning.rst

Qubes OS hardware requirements
------------------------------

In order to install and use SecureDrop Workstation, you will need a Qubes-Compatible computer with the following speifications:

- 64-bit Intel or AMD processor with virtualization support
- a minimum of 16GB RAM (32GB recommended for production use)
- sufficient disk space for the Qubes OS base install and SecureDrop Workstation VMs (a 128GB or greater SSD is recommended)

More information on hardware compatibility can be found on the `Qubes OS System Requirements <https://www.qubes-os.org/doc/system-requirements/>`_ page, and information on specific systems can be found via the `hardware compatibility list <https://www.qubes-os.org/hcl/>`_.

In order to print submissions, a supported non-networked printer is required. Supported models currently include:

- Brother HL-L2320D
- HP LaserJet Pro M404n

More printer options will be added in future releases.

Lenovo ThinkPad T480
--------------------
The ThinkPad T480 is a recommended option for SecureDrop Workstation, as it is being used by the core team for development and testing. If you plan to use it, you should follow the instructions below to ensure that the BIOS is up to date before proceeding with the installation:

.. _t480_bios:

Upgrading the T480 BIOS
~~~~~~~~~~~~~~~~~~~~~~~

The instructions below assume the use of a Linux-based computer for the creation of a BIOS upgrade USB. To upgrade the T480 BIOS:

- Locate the machine type of the T480 - it be found via the ``Main`` tab in Thinkpad Setup (accessed by pressing **Enter** on startup). For recent T480s, it will be a string like `20L5` or `20L6`.
- Visit `<https://support.lenovo.com>`_ in the Linux-based computer. Type the machine type found above into the search bar, then press **Enter**.
- In the T480 Product Home page, select **Drivers And Software** and choose **BIOS/UEFI**.
- Expand the **BIOS Update** listing and download the **BIOS Update (Bootable CD)** file.
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
