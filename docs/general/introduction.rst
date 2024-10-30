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

Who is behind SecureDrop Workstation?
-------------------------------------
SecureDrop and SecureDrop Workstation are open source projects of
`Freedom of the Press Foundation (FPF) <https://freedom.press/>`_, a
US-based nonprofit organization. You can support our work through
`your donation <https://freedom.press/donate>`_ or by
`contributing to SecureDrop development <https://developers.securedrop.org/en/latest/contributing.html>`_.

Our work would not be possible without the larger open source community.

The foundation of SecureDrop Workstation is `Qubes OS <https://www.qubes-os.org/>`_.
FPF has directly sponsored Qubes OS development, and we encourage you to
`donate to Qubes OS <https://www.qubes-os.org/donate/>`_ as well.

SecureDrop Workstation uses `Whonix <https://www.whonix.org/>`_ to maintain
connectivity with the Tor network. You can `make a donation to the Whonix project <https://www.whonix.org/wiki/Donate>`_.

In addition, SecureDrop Workstation relies on other open source projects such as
`grsecurity <https://www.grsecurity.net>`_, `Python <https://www.python.org/>`_,
`Debian <https://www.debian.org/>`_, `Fedora <https://fedoraproject.org/>`_,
`GNOME <https://www.gnome.org/>`_, `GnuPG <https://gnupg.org/>`_,
`LibreOffice <https://www.libreoffice.org/>`_,
`Audacious <https://audacious-media-player.org/>`_, and others. Please consider
contributing to these projects as well.

For more information on SecureDrop Workstation, see our :doc:`FAQ <../journalist/faq>`.
