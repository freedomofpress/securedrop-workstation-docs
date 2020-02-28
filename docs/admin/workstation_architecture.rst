SecureDrop Workstation Architecture
===================================

.. include:: ../includes/top-warning.rst

.. _Networking Architecture:

SecureDrop Workstation networking architecture
----------------------------------------------
One key security feature of Qubes OS is that it enables users to configure the
appropriate level of network access for each VM. For example, you could have a
VM for password storage that has no network access, a work VM that is firewalled
to only connect to work servers, and a personal VM that always uses Tor.

In the context of SecureDrop Workstation, these capabilities are used to
minimize the risk that an adversary who is able to exploit a security
vulnerability in order to exfiltrate documents or private keys. Specifically,
the following VMs have no network access:

- ``sd-app``, which runs the SecureDrop Client, and holds decrypted messages,
  replies, and documents.
- ``sd-viewer``, which is the template for disposable VMs used for opening
  documents from the SecureDrop Client.
- ``sd-gpg``, which holds the *Submission Private Key* required to decrypt
  messages, replies, and documents.
- ``sd-devices``, which passes exported documents through to USB devices like
  printers and encrypted flash drives.

By design, the Qubes OS host domain, ``dom0``, also does not have Internet
access.

.. note:

   If you attempt to directly access the network in any of these VMs, it will
   not work. That is the expected behavior.

Because the SecureDrop Client must connect to the SecureDrop
*Application Server* in order to send or retrieve messages, documents, and
replies, it can communicate through Qubes-internal system calls with another
VM, ``sd-proxy``, which can only access the open Internet through the Tor
network, using the separate ``sd-whonix`` VM.

Like all networked VMs, ``sd-whonix`` uses the ``sys-firewall`` service to
connect to the network, which is provided via ``sys-net``. All four VMs must be
running for the client to successfully connect to the server.

.. important:

   The ``sd-whonix`` VM contains a sensitive authentication token required to
   access the SecureDrop API via Tor, and should not be attached to VMs that are
   unrelated to SecureDrop.

Qubes OS ships with a Whonix service called ``sys-whonix``. When troubleshooting
network issues specific to SecureDrop, ``sys-whonix`` is only relevant during
updates of the Whonix VMs (e.g., while the preflight updater is running).