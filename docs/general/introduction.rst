Introduction
============

What is Qubes OS?
-----------------

`Qubes OS`_ is an open source, security-focused
operating system. It is very different than operating systems you may be
familiar with already, because it consists of multiple
isolated virtual machines that allow you to separate more
trusted components, files, or programs on your computer from less trusted
components, files, or programs.

Broadly speaking, this means that even if files in one of your virtual machines
are exposed to malware, files in others still have some protection, which is
not true of other operating systems.

.. _`Qubes OS`: https://www.qubes-os.org

What is SecureDrop Workstation?
-------------------------------

SecureDrop Workstation is a project that uses Qubes to make
SecureDrop faster and simpler for journalists to use.

A key feature of SecureDrop is that journalists can receive submissions from
unknown sources without risking the security of their own machines and
networks. Previously, SecureDrop accomplished this by using a physical airgap
(the *Secure Viewing Station*), meaning that to view submissions, journalists
would have to download them, transfer them to an encrypted USB drive, and
physically take that drive to a separate, non-networked computer for decryption
and viewing. SecureDrop Workstation combines all of those steps
into one workflow on one machine: a Qubes computer that
combines the *Journalist Workstation* and the *Secure Viewing Station*.

For more information on SecureDrop Workstation, see our :doc:`faq <../journalist/faq>`.
