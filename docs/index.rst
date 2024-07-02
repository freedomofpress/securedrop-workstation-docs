.. SecureDrop Workstation documentation master file, created by
   sphinx-quickstart on Mon Jan 13 07:57:19 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the SecureDrop Workstation documentation!
====================================================

.. include:: includes/top-warning.rst

SecureDrop Workstation is a tool to enable journalists to communicate with
anonymous sources and manage submitted documents, while providing mitigations
against malware and other security risks. It is built on Qubes OS and requires a
`SecureDrop <https://securedrop.org/>`__ server setup.

.. toctree::
   :maxdepth: 2
   :caption: Overview
   
   general/introduction
   general/workstation_architecture
   general/status
   general/known_issues

.. toctree::
   :maxdepth: 2
   :caption: Journalist Guide

   journalist/starting_qubes
   journalist/starting_client
   journalist/sources
   journalist/submissions
   journalist/ending_session
   journalist/faq
   
.. toctree::
   :maxdepth: 2
   :caption: Admin Guide: Installation

   admin/install/overview
   admin/install/prepare
   admin/install/install
   admin/install/troubleshoot

.. toctree::
   :maxdepth: 2
   :caption: Admin Guide: Reference

   admin/reference/hardware
   admin/reference/securing_workstation
   admin/reference/managing_clipboard
   admin/reference/reviewing_logs
   admin/reference/troubleshooting_connection
   admin/reference/troubleshooting_updates
   admin/reference/provisioning_usb
   admin/reference/upgrading_fedora
   admin/reference/backup

* :ref:`genindex`
* :ref:`search`
