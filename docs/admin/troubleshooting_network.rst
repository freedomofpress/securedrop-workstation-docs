Troubleshooting network issues
==============================

.. include:: ../includes/top-warning.rst


Verifying connectivity
----------------------

You can use both wireless and wired networks in Qubes, although we recommend using
a wired connection whenever possible. You can manage network access through the
network manager, which you can find in the area populated with icons in the top
right corner of your Qubes desktop.

The network manager looks like this for a wired connection:

[insert network manager wired icon]

And it looks like this for a wireless connection:

[insert network manager wired icon]

.. note::
   If Qubes is able to connect to both a wired and a wireless network, the wired
   connection will take precedence, and the network manager icon for a wired
   connection will be shown. However, Qubes may still maintain a wireless
   connection in parallel, and fall back to it if the wired connection is lost.

When a network connection is lost, Qubes will display an alert like the
following:

[insert lost connection notification]

Common causes for lost connections include fully or partly unplugged network cables,
lost power to networking equipment, and ISP service outages. What's specific
to Qubes and SecureDrop Workstation is how access to the network is managed
across different VMs, and how the Tor network is used.

To effectively troubleshoot these system-specific issues, it is necessary to
understand the SecureDrop Workstation networking architecture at a high level.


SecureDrop Workstation networking architecture
----------------------------------------------
One key security feature of Qubes OS is that it enables users to configure the
appropriate level of network access for each VM. For example, you could have a
VM for password storage that has no network access, a work VM that is firewalled
to only connect to work servers, and a personal VM that always uses Tor.

In the context of SecureDrop Workstation, these capabilities are used to
minimize the risk that an adversary who is able to exploit a security
vulnerability could exfiltrate documents or private keys. Specifically, the
following VMs have no network access:

- ``sd-app``, which runs the SecureDrop Client, and holds decrypted messages,
  replies, and documents.
- ``sd-viewer``, which is the template used for disposable VMs for opening
  documents from the SecureDrop Client.
- ``sd-gpg``, which holds the *Submission Private Key* required to decrypt
  messages, replies, and documents.
- ``sd-devices``, which passes exported documents through to USB devices like
  printers and encrypted flash drives.

.. important:

   If you attempt to directly access the network in any of these VMs, it will
   not work, and that is the expected behavior.

Because the SecureDrop Client must connect to the SecureDrop
*Application Server* in order to send or retrieve messages, documents, and
replies, it can communicate through Qubes-internal system calls with another
VM, ``sd-proxy``.



Issues to cover:

- Use of network manager in Qubes
- Networking architecture of the workstation
   + Networkless VMs
- "Can't log in" - excluding other causes
   + 2FA errors
   + Double-checking passphrase
   + Problems with ``sd-proxy``
- Ensuring all required VMs are running
- Restarting Tor in ``sd-whonix`` via control panel
- Restarting ``sd-proxy`` and ``sd-whonix``
- Testing network connection without Tor
- Testing network connection in ``sd-whonix``
- Inspecting logs