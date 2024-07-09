Troubleshooting Installation Errors
===================================
.. include:: ../../includes/top-warning.rst

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

"Unable to reset PCI device"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On some hardware, network devices (Ethernet and Wi-Fi) will not immediately work out of the box and require a one-time manual configuration on install. After Qubes starts for the first time, ``sys-net`` will fail to start:

|screenshot_sys_net_pci_reset|

Open a ``dom0`` terminal via **Q > Settings Gear > Other Tools > Xfce Terminal**, and run the following command to list the devices connected to the ``sys-net`` VM.

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

.. |screenshot_sys_net_pci_reset| image:: ../../images/screenshot_sys_net_pci_reset.png

.. |Attach TailsData| image:: images/attach_usb.png
  :width: 100%
.. |Unlock Tailsdata| image:: images/unlock_tails_usb.png
  :width: 100%

Getting Support
---------------
.. include:: ../../includes/getting_support.rst
