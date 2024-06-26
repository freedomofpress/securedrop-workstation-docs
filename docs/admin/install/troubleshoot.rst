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
.. include:: ../../includes/getting_support.rst
