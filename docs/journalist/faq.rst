FAQ
===

Frequently Asked Questions
--------------------------

How does SecureDrop Workstation work?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SecureDrop Workstation is a Qubes-based project. It consists of several
different carefully-configured virtual machines (VMs), so that everything a
journalist needs to use SecureDrop resides on one computer. Encryption and
decryption happen with one click using a network-isolated VM that holds the
SecureDrop Submission Key. Submissions can be viewed securely on the same
machine thanks to a `feature of Qubes`_ that creates temporary VMs in
which to view untrusted content without exposing the rest of your system to
that content.

As a journalist, you will log into the SecureDrop application with the
same credentials you previously used to log into the Journalist Interface. You
will then be able to view, download, and reply to and submissions---all on the
same device.

.. | securedrop_workstation_workflow |

.. _`feature of Qubes`: https://www.qubes-os.org/doc/disposablevm/

How is using Qubes different from using virtual machines?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Virtual machines that run on your Mac, Windows, or Linux machine (such as those
created using VirtualBox, Parallels, and so on) are a "guest" on your machine,
but still require a "host" operating system on top of which to run. These virtual machines are not designed as security tools; if the host OS is
compromised, there are no protections for the guest OS, and some features (such
as networking) allow communications between guest and host that can compromise
the security of both.

In contrast, Qubes virtualization occurs at a lower level, under the `Xen
hypervisor`_. This means that virtual machines (VMs) in a Qubes environment
can run operating systems that are independent of each
other and are not reliant on a host OS.

In addition, these virtual machines can be used to quarantine specific
functions of your computer. For example, network access is provided via two or
more VMs, and you can control which applications or files
have access to a networked environment by connecting to or disconnecting from
these VMs.

Finally, Qubes is designed to make it more difficult for malware to remain on
your machine. Each VM has read-only access to the root filesystem that
provides its operating system, meaning that if a VM is infected
with malware, it will be more difficult for that malware to persist across a
reboot of that VM.

For more about the security features of Qubes, see
`the Qubes OS documentation`_.

.. _`Xen hypervisor`: https://wiki.xen.org/wiki/Xen_Project_Software_Overview
.. _`the Qubes OS documentation`: https://www.qubes-os.org/faq/#general--security

How secure is Qubes? How does the security of this system compare to using an air-gapped Secure Viewing Station?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[This section is a stub]
  - Audits
  - grsec
  - Qubes OS team
  - Our security team
  - Discuss Xen
  - Discuss benefits of avoiding systems where security responsibility is on the user (opsec concerns)

Can I install custom software on SecureDrop Workstation?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Right now, the pilot project is designed to make the journalist experience
easier by combining the functionality of the Journalist Workstation and Secure
Viewing Station. The main focus is making sure that checking SecureDrop is
easier and faster. While we hope to add advanced tooling and document-
processing options down the line, at this time we request that you leave the
workstation configured the way it was provisioned, and hold off on installing
additional software or changing the functionality or configuration of any of
the VMs. If you have specific needs that you'd like to discuss with us, open an
issue `in our support portal`_ or send us a `GPG-encrypted email`_ at
support@freedom.press.

.. _`in our support portal`: https://support.freedom.press/
.. _`GPG-encrypted email`: https://securedrop.org/sites/default/files/fpf-email.asc

Why can’t I save or print from the Viewer VM apps?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[This section is a stub]
 - Sandbox/isolation and comparison to SVS
 - Viewer VM being a "true" sandbox means avoiding opening potentially
   malicious files in environments where you may also attach external devices
   (printers, USB sticks); the workstation prevents this

It takes a long time to start SecureDrop Workstation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[This section is a stub]
 - Updates must be fetched, they are important to security
