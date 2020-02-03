Working with submissions
========================

.. include:: ../includes/top-warning.rst

When a source submits files, you will see a Download button in the conversation
flow, a file size, and light-gray text that says "Encrypted file on server."

.. | screenshot_file_before_download |

Downloading
-----------

To download a file, click the **Download** button.

.. | screenshot_download_button |

In the top left corner of the application window, you will see a message that
the file is downloading.

.. | screenshot_file_downloading |

Once the file has downloaded, the filename will be visible, as will the words
**Export** and **Print**.

.. | screenshot_file_download_successful |

Viewing
-------

To view a downloaded submission, double-click on the filename. This will open
the file in a temporary environment, called a "disposable VM." The file you
clicked on will open in a new window with a different colored border and a
window title prefixed with "disp" (meaning disposable).

.. | screenshot_dispvm |

This disposable VM is a special isolated environment similar to the *Secure
Viewing Station*; it does not have internet access, and isolates the files that
you are viewing from other sensitive files and applications on the SecureDrop
Workstation.

Because this isolation is important to the security of your system, you will
notice that certain tools that you may be used to have been disabled. For
example, the copy-and-paste keyboard will not allow you to copy to or from a
disposable VM. For more information about this and other security features of
Qubes, see `the Qubes OS documentation`_.

.. tip:: In Qubes, window border colors are used to signify different virtual
   machines.

.. _`the Qubes OS documentation`: https://www.qubes-os.org

Printing
--------

To print a document, click the **Print** button. Currently, printing is only
supported with select printers from Brother and HP, and for security reasons
you are required not to use a printer that has any wireless capabilities. You
should have access to a compatible printer that has been set up by your
administrator.

Exporting to an Export USB
--------------------------

Currently, a LUKS-encrypted USB drive is required for exporting submissions. A
Linux-based system such as Tails is required to configure and use a LUKS-
encrypted drive, meaning that for the time being, you will only be able to
export to a Linux environment where these drives can be read. For assistance
with this, see your SecureDrop administrator.

Once you have provisioned a LUKS-encrypted export drive, insert the drive and
click **Export**.

.. | screenshot_export_drive |
