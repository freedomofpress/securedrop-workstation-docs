Recommended hardware
====================

Qubes OS hardware requirements
------------------------------

In order to install and use SecureDrop Workstation, you will need a Qubes-Compatible computer with the following specifications:

- 64-bit Intel processor with virtualization support
- a minimum of 32GB RAM
- sufficient disk space for the Qubes OS base install and SecureDrop Workstation VMs (a 128GB or greater SSD is recommended)

More information on hardware compatibility can be found on the `Qubes OS System Requirements <https://www.qubes-os.org/doc/system-requirements/>`_ page.


Choosing a laptop
-----------------
We recommend against a device that requires an external USB keyboard or other externally-connected devices, for security reasons. In practice this usually means that you should run SecureDrop Workstation on a Qubes-compatible laptop. Not all laptops support Qubes, and some may require additional customization. We recommend (in order) either a Qubes-certified laptop, one of the laptop models we use for development and testing, or a computer from the community-maintained Qubes Hardware compatibility list.

Qubes-certified laptops
~~~~~~~~~~~~~~~~~~~~~~~

Qubes-certified laptops are certified and tested against Qubes major releases. They must support additional security features beyond the minimal requirements above, such as the use of `coreboot <https://www.coreboot.org/>`_ in place of proprietary firmware. Where possible, we recommend that you use a Qubes-certified laptop with ``coreboot`` for SecureDrop Workstation. A full list of certified computers can be found on the `Qubes OS Certified Hardware <https://www.qubes-os.org/doc/certified-hardware/>`_ page.

        .. note:: Some certified computers also support the use of `Heads <https://osresearch.net>`_ with ``coreboot``, for additional protection against advanced attacks during the boot process. Heads adds a layer of complexity to the overall user experience, but may make sense for you as an option if you have an expectation of those kinds of threats. If you have questions about Heads, or other hardware choices, contact us via the `SecureDrop support portal <https://support.freedom.press>`_.

FPF-tested laptops
~~~~~~~~~~~~~~~~~~
In addition to Qubes-certified devices, we develop and test using Qubes-compatible laptops from other vendors. The following models may be used for SecureDrop Workstation, though some level of additional configuration may be required.

.. _thinkpad_x_series:

Lenovo ThinkPad X1 Carbon (10th-generation)
*******************************************

The 10th-generation ThinkPad X1 Carbon **with a 12th-generation Intel Core processor** is a recommended option for the SecureDrop Workstation beginning with Qubes 4.1.  If you plan to use it:

- If your laptop has come with Ubuntu preinstalled, run its **Software Updater** twice as follows:

  #. to install software updates, especially for the ``fwupd`` package; and then
  #. to run ``fwupd`` to update the BIOS automatically.

  If **Software Updater** offers to run ``fwupd`` during step (1), decline until step (2), to make sure ``fwupd`` itself has received its latest security updates.

- Otherwise, follow the instructions below to ensure that the BIOS is up to date.

You'll need to have a USB-to-Ethernet adapter on hand in order to :ref:`apply Qubes updates <apply_dom0_updates>`, which will enable Wi-Fi and fix glitchy video rendering and cursor performance.

.. _thinkpad_t_series:

Lenovo ThinkPad T14 (2nd-generation)
************************************

The 2nd-generation ThinkPad T14 **with an 11th-generation Intel Core processor** is a recommended option for the SecureDrop Workstation beginning with Qubes 4.1. If you plan to use it:

- If your laptop has come with Ubuntu preinstalled, run its **Software Updater** twice as follows:

  #. to install software updates, especially for the ``fwupd`` package; and then
  #. to run ``fwupd`` to update the BIOS automatically.

  If **Software Updater** offers to run ``fwupd`` during step (1), decline until step (2), to make sure ``fwupd`` itself has received its latest security updates.

- Otherwise, ensure the BIOS is up-to date by following these instructions: :doc:`thinkpad_bios`.

The Ethernet and Wi-Fi controllers may not work without one-time manual configuration, as documented in the following sections.

Ethernet controller
^^^^^^^^^^^^^^^^^^^
After Qubes starts for the first time, when ``sys-net`` fails to start, follow the troubleshooting instructions for :ref:`reset_pci`, but only for the ``dom0:00_1f.6`` Ethernet device.

.. _framework_13_series:

Framework 13 13th generation laptop
***********************************
TK text and description here

The Qubes Hardware Compatibility List (HCL)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TK text and description here

Choosing a printer
------------------
In order to print submissions, a supported non-networked printer is required. We have tested and recommend the HP LaserJet Pro M404n. More printer options will be added in future releases.

