Forensic Backups
================

In response to
`CVE-2025-24889 <https://github.com/freedomofpress/securedrop-client/security/advisories/GHSA-933q-fx9h-5g46>`_,
SecureDrop Workstation 1.0.2 rebuilds the ``sd-log`` VM and preserves a backup of the
original VM on affected systems. The backup is created using the
`Qubes Backup tool <https://www.qubes-os.org/doc/backup-restore/>`_ and stored
in a dedicated, non-networked VM called ``sd-retain-logvm``.

Access the sd-log system image
------------------------------

To recover the backup for inspection or forensic analysis, use the
`Qubes Backup Restore tool <https://www.qubes-os.org/doc/backup-restore/>`_
to transfer the backup to external storage media, then transfer it to another machine.

The backup is stored in ``/home/user/SDLog_Backups`` in the ``sd-retain-logvm`` VM and is a
compressed archive with filename ``qubes-backup-YYYY-MM-DDTHHMMSS``.

It has a hard-coded passphrase of ``SDW_SDLOG`` (This is not a security measure, but was
set in order to automate the backup process).

.. warning::
  Do not restore the backup on your SecureDrop Workstation machine.

Qubes OS provides documentation for recovering backups both on Qubes OS and on other
operating systems.

* `On other operating systems <https://www.qubes-os.org/doc/backup-emergency-restore-v4/>`_
* `On Qubes <https://www.qubes-os.org/doc/how-to-back-up-restore-and-migrate/#restoring-from-a-backup>`_

The target volume (relevant for non-Qubes recovery instructions) is ``sd-log/private.img``.

Use caution if restoring on a Qubes OS machine, since the entire VM will be restored.
We are not aware of anyone exploiting CVE-2025-24889, but in theory, the VM could contain
malicious code, which is why it was rebuilt.

Artifact Retention
------------------

The archive VM ``sd-retain-logvm`` and its contents will be deleted in a subsequent SecureDrop
Workstation update, planned for two months from the release of this announcement
(planned removal early April 2025). To retain the archive for a longer period, follow the
steps above to transfer it off SecureDrop Workstation.

If you have any questions, please `contact Support <https://support.freedom.press>`_.
