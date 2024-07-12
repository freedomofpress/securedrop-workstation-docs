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

Current known issues
--------------------

- Updates are slow due to the number of VMs involved, and due to some updates
  being fetched over Tor. We are investigating various strategies to improve
  performance and reliability of the updater.
- SecureDrop instances with very large numbers of sources may encounter
  UI performance issues. While performance improvements are on the roadmap,
  `our recommendation <https://docs.securedrop.org/en/stable/admin/maintenance/backup_and_restore.html#minimizing-disk-use>`_
  is to delete information from the servers as regularly as possible, both
  for performance and security reasons.
- While failed file downloads are automatically retried a few times, there is currently
  no mechanism for further retries or cancelling in-progress downloads.
  This feature is planned.
- Printer support is limited to a specific HP printer model, and printing
  different file types is not as reliable yet as under Tails. Support for
  additional non-networked printers will be added in a future release.
- Currently, only app-based two-factor authentication (TOTP) is supported.
- The SecureDrop Client does not currently handle files that are "double-encrypted"
  (when a source pre-encrypts a submission locally before uploading it to SecureDrop).
  Until this is fully supported, we suggest using the Tails-based *Secure Viewing
  Station* for pre-encrypted submissions.
- There are a limited number of file types that can be viewed on
  SecureDrop Workstation. Some file types (such as `.heic`) are not
  yet supported for viewing, and must be exported via USB, and/or viewed using
  the Tails-based *Secure Viewing Station*. Broader file type support is planned.
- If the *Submission Key* for your SecureDrop server was rotated in the past,
  you must manually re-add the old key to your vault VM (`sd-gpg`) in order to
  view old submissions in SecureDrop Client. Contact Support for assistance.
- We do not support uninstalling SecureDrop Workstation without wiping all of
  Qubes OS. There is an ``--uninstall`` option for ``sdw-admin``, but it is not
  officially supported and will leave behind sensitive material in
  ``/usr/share/securedrop-workstation-dom0-config`` in ``dom0``. If you need to decomission
  a SecureDrop Workstation, please contact us for assistance.
