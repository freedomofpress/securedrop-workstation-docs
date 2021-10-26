Limitations and known issues
============================

.. include:: ../includes/top-warning.rst
Reporting issues
----------------

For the duration of the pilot, bugs and other issues found in
*SecureDrop Workstation* should be reported by pilot participants via the
`support portal <https://support.freedom.press>`_. Issues that are not instance-
specific will be added to the appropriate public issue tracker by the developers,
for example:

 - `SecureDrop Workstation issues <https://github.com/freedomofpress/securedrop-workstation/issues>`_ - issues related to the Qubes environment and workstation provisioning.
 - `SecureDrop Client issues <https://github.com/freedomofpress/securedrop-client/issues>`_ - issues related to the *SecureDrop Client*.

 - `SecureDrop Export issues <https://github.com/freedomofpress/securedrop-export/issues>`_ - issues related to printing and exporting submissions.

Current known issues
--------------------

- Updates are slow due to the number of VMs involved, and due to some updates
  being fetched over Tor. We are investigating various strategies to improve
  performance and reliability of the updater.
- Currently, only LUKS-encrypted *Export Devices* are supported. VeraCrypt support
  will be added in a future release.
- Printer support is limited to a specific HP printer model, and printing
  different file types is not as reliable yet as under Tails. Support for
  additional non-networked printers will be added in a future release.
- Currently, only app-based two-factor authentication (TOTP) is supported.
- The SecureDrop Client can only be configured with a single *Submission Key*.
  If the *Submission Key* for your SecureDrop server was rotated in the past,
  and submissions encrypted with the old key are still on your server, you will
  not be able to open them with the SecureDrop Client.
