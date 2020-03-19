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
- Printer support is limited to specific models by Brother and HP. Support for
  more non-networked printers will be added in a future release.
- "Flag for reply" functionality is not implemented in the *SecureDrop Client*.
  This is used when a source's reply key was not created on their first
  submission and needs to be created on their next visit.
  If you are logged into the SecureDrop Client, and the reply feature for a
  source is disabled for more than a minute, they must be flagged for reply in
  the *Journalist Interface* - see the `SecureDrop "Flag for Reply"
  documentation <https://docs.securedrop.org/en/stable/journalist.html#flag-for-reply>`_ for more information.
