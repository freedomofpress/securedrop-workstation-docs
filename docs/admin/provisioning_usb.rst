Provisioning Export USB devices
===============================

.. include:: ../includes/top-warning.rst

SecureDrop Workstation supports the export of submissions from the Qubes client
to an encrypted USB *Export Device*. 

.. note:: Currently only LUKS-encrypted devices are supported,
  which effectively restricts the *Export Device* to use with Linux-based
  systems such as Tails. Support for Veracrypt-encrypted devices is planned,
  which will allow the use of the *Export Device* with MacOS and Windows systems.

In order to provision an *Export Device* for  use with SecureDrop Workstation,
you will need a fresh USB stick and a Linux-based system. Tails is recommended -
if available, the  *Secure Viewing Station* can be used, adding the extra benefit
of its airgap:

- First, boot into the *Secure Viewing Station*, without unlocking its 
  persistent volume or setting an admin password. 
- Next, open the Disks utility: **Applications > Utilities > Disks**.
- Connect the fresh USB stick and select it in the list in the left-hand panel.

.. warning:: The formatting operation will wipe any data on an existing partition.
  Make sure that you select the correct device!

- Click the interlocking gear icon under the drive volumes schematic in the 
  right-hand panel and choose **Format Partition...**.
- Select the following options in the Format Volume dialog:

  - Volume Name: Transfer
  - Type: Ext4, with the "Password protect volume (LUKS)" option enabled

- Then, click **Next**. You will be prompted to set a password. This password
  should be strong - a 6-word `Diceware <https://en.wikipedia.org/wiki/Diceware>`_
  passphrase is highly recommended.
- Once the password is set, click **Format**, then when prompted, click **Format**
  again. The formatting process should take only a few seconds.
- Once formatting is complete, you will need to provide the *Export Device* and
  its decryption password to the SecureDrop Workstation users. Make sure that
  they store it and its password securely, as it will contain decrypted 
  submissions.
