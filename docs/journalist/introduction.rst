Introduction
============

.. include:: ../includes/top-warning.rst

What is Qubes OS?
-----------------

`Qubes OS`_ is an open source, security-focused
operating system. It is very different than operating systems you may be
familiar with already, because the operating system consists of multiple
isolated virtual machines (called qubes), which allow you to separate more
trusted components, files, or programs on your computer from less trusted
components, files, or programs.

Broadly speaking, this means that even if one of your qubes is
exposed to malware, your other qubes can still be protected, which is not true
of other operating systems.

.. _`Qubes OS`: https://www.qubes-os.org

How is using Qubes different from using virtual machines?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Virtual machines that run on your Mac, Windows, or Linux machine (such as those
created using VirtualBox, Parallels, and so on) are a "guest" on your machine,
but still require a "host" operating system on top of which to run. These types
of virtual machines are not designed as security tools; if the host OS is
compromised, there are no protections for the guest OS, and some features (such
as networking) allow communications between guest and host that can compromise
the security of both.

In contrast, Qubes virtualization occurs at a lower level, under the `Xen
hypervisor`_. This means that virtual machines (qubes) in a Qubes environment
can run operating systems that are isolated from and independent of each
other. In addition, qubes can be used to quarantine specific functions of your
computer. For example, network access is provided via two or more
qubes, and you can control which applications or files
have access to a networked environment by connecting to or disconnecting from
these qubes.

Finally, Qubes is designed to make it more difficult for malware to remain on
your machine. Each qube has read-only access to the root filesystem that
provides the operating system for that qube, meaning that if a qube is infected
with malware, it will be more difficult for that malware to persist across a
reboot of that qube.

For more about the security features of Qubes, see
`the Qubes OS documentation`_.

.. _`Xen hypervisor`: https://wiki.xen.org/wiki/Xen_Project_Software_Overview
.. _`the Qubes OS documentation`: https://www.qubes-os.org/faq/#general--security

What is SecureDrop Workstation?
-------------------------------

SecureDrop Workstation is a pilot project that uses Qubes to make
SecureDrop faster and simpler for journalists to use.

A key feature of SecureDrop is that journalists can receive submissions from
unknown sources without risking the security of their own machines and
networks. Previously, SecureDrop accomplished this by using a physical airgap
(the *Secure Viewing Station*), meaning that to view submissions, journalists
would have to download them, transfer them to an encrypted USB drive, and
physically take that drive to a separate, non-networked computer for decryption
and viewing. The SecureDrop Workstation project combines all of those steps
into one workflow on one machine: a Qubes computer that
combines the *Journalist Workstation* and the *Secure Viewing Station*.

How does it work?
~~~~~~~~~~~~~~~~~

SecureDrop Workstation contains several different carefully-configured qubes,
so that everything a journalist needs to use SecureDrop resides on one
computer. Encryption and decryption happen with one click using a network-
isolated qube that holds the SecureDrop Application Key. Submissions can be
viewed securely on the same machine thanks to a `feature of Qubes`_ that
creates temporary containers in which to view untrusted content without
exposing the rest of your system to that content.

As a journalist, you will turn log into the SecureDrop application with the
same credentials you previously used to log into the Journalist Interface. You
will then be able to view, reply to, and download submissions---all on the same
device. This means that you no longer need to use a Tails USB, Transfer Device,
or Export Device to access SecureDrop.

.. | securedrop_workstation_workflow |

.. _`feature of Qubes`: https://www.qubes-os.org/doc/disposablevm/
