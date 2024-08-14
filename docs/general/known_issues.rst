Limitations and known issues
============================

Reporting issues
----------------

Please report sensitive issues that are specific to your instance
via the `support portal <https://support.freedom.press>`_. 

Bugs and other issues that are not specific to your instance can be reported
via GitHub using the following links:

 - `SecureDrop Workstation issues <https://github.com/freedomofpress/securedrop-workstation/issues>`_ - issues related to the Qubes environment and workstation provisioning.
 - `SecureDrop Client issues <https://github.com/freedomofpress/securedrop-client/issues>`_ - issues related to the *SecureDrop Client*.
 
If you encounter a security-related issue, please see
`SECURITY.md <https://github.com/freedomofpress/securedrop-workstation/blob/main/SECURITY.md>`_ 
for instructions on how to privately report it.

Current known issues
--------------------

- Searching/filtering by codename is not yet implemented.
- While failed file downloads are automatically retried, there is currently
  no mechanism cancelling in-progress downloads or viewing the progress or speed of
  a download. These features are planned.
- Updates are slow due to the number of VMs involved, and due to some updates
  being fetched over Tor. We have made improvements to the performance and reliability
  of the updater, and this work will continue.
- SecureDrop instances with very large numbers of sources may encounter
  UI performance issues. While performance improvements are on the roadmap,
  `our recommendation <https://docs.securedrop.org/en/stable/admin/maintenance/backup_and_restore.html#minimizing-disk-use>`_
  is to delete information from the servers as regularly as possible, both
  for performance and security reasons.
- Printer support is limited to specific HP and Brother printer models, and printing
  different file types is not as reliable yet as under Tails. Support for
  additional non-networked printers will be added in a future release.
- Printing of individual files inside an archived submission is not yet supported.
- Currently, only app-based two-factor authentication (TOTP) is supported.
- The SecureDrop Client does not currently handle files that are "double-encrypted"
  (when a source pre-encrypts a submission locally before uploading it to SecureDrop).
  Until this is fully supported, we suggest using the Tails-based *Secure Viewing
  Station* for pre-encrypted submissions.
- There are a limited number of file types that can be viewed on
  SecureDrop Workstation. Some file types (such as `.eml`) are not
  yet supported for viewing, and must be exported via USB, and/or viewed using
  the Tails-based *Secure Viewing Station*. :doc:`Broader file type support is planned <supported_filetypes>`.
- If the *Submission Key* for your SecureDrop server was rotated in the past,
  you must manually re-add the old key to your vault VM (`sd-gpg`) in order to
  view old submissions in SecureDrop Client. Contact Support for assistance.
- We do not support uninstalling SecureDrop Workstation without wiping all of
  Qubes OS. There is an ``--uninstall`` option for ``sdw-admin``, but it is not
  officially supported and will leave behind sensitive material in
  ``/usr/share/securedrop-workstation-dom0-config`` in ``dom0``. If you need to decomission
  a SecureDrop Workstation, please contact us for assistance.
