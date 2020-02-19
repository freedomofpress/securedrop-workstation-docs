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
- ``sd-viewer``, which is the template for disposable VMs used for opening
  documents from the SecureDrop Client.
- ``sd-gpg``, which holds the *Submission Private Key* required to decrypt
  messages, replies, and documents.
- ``sd-devices``, which passes exported documents through to USB devices like
  printers and encrypted flash drives.

.. important:

   If you attempt to directly access the network in any of these VMs, it will
   not work. That is the expected behavior.

Because the SecureDrop Client must connect to the SecureDrop
*Application Server* in order to send or retrieve messages, documents, and
replies, it can communicate through Qubes-internal system calls with another
VM, ``sd-proxy``, which can only access the open Internet through the Tor
network, using the separate ``sd-whonix`` VM.

Qubes OS ships with a Whonix service called ``sys-whonix``. When troubleshooting
network issues specific to SecureDrop, ``sys-whonix`` is only relevant during
updates of the Whonix VMs.

SecureDrop Workstation uses the ``sd-whonix`` service to connect to SecureDrop.
It contains a sensitive authentication token required to access the SecureDrop
API via Tor, and should not be attached to VMs that are unrelated to SecureDrop.

Troubleshooting login issues
----------------------------
If you experience difficulty logging into SecureDrop using the SecureDrop
Client, this may or may not be a network issue. Before taking other steps,
please make sure that your username, passphrase, and two-factor code are correct.

You can reveal the passphrase by clicking the "eye" icon next to it in the login
dialog (ensure you are in a fully private setting before doing so). Check for
extra characters at the beginning at the end, or subtle differences like
capitalization.

Wait for a new two-factor code from your app before trying again. If you access
multiple sites and services using a single two-factor app, make sure that the
correct site or service is selected.

If you have access to a Tails-based *Journalist Workstation*, verify whether you
can access SecureDrop using the same credentials that do not work in Qubes.

Troubleshooting network access via ``sd-proxy`` and ``sd-whonix``
-----------------------------------------------------------------
If you are confident that your login credentials are correct, or you are
experiencing network issues past the login stage, we recommend the following 
steps:

- Ensuring all required VMs are running
- Restarting Tor in ``sd-whonix`` via control panel
- Restarting ``sd-proxy`` and ``sd-whonix``
- Testing network connection without Tor
- Testing network connection in ``sd-whonix``
- Inspecting logs