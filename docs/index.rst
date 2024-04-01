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

.. toctree::
   :maxdepth: 2
   :caption: Guide for Journalists

   journalist/starting_qubes
   journalist/starting_client
   journalist/sources
   journalist/submissions
   journalist/ending_session
   journalist/faq


.. toctree::
   :maxdepth: 2
   :caption: Guide for Administrators

   admin/hardware
   admin/install
   admin/securing_workstation
   admin/managing_clipboard
   admin/reviewing_logs
   admin/troubleshooting_connection
   admin/troubleshooting_updates
   admin/provisioning_usb
   admin/known_issues
   admin/upgrading_fedora
   admin/backup

* :ref:`genindex`
* :ref:`search`
