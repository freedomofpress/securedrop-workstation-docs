SecureDrop Workstation Project Status
=====================================

SecureDrop Workstation is currently in active development.

Freedom of the Press Foundation had operated a pilot program with a limited
number of organizations whose environments were especially well-suited for
early testing of the Workstation. This pilot program has now ended.

With the 1.0.0 release, we’re now switching to an open beta. If you are
interested in using SecureDrop Workstation, please reach out to us
via the `support portal <https://support.freedom.press>`_.

Is SecureDrop Workstation right for you?
----------------------------------------

Until SecureDrop Workstation reaches general availability, we would
recommend against using it in production environments (outside of users
who have already installed it as part of the pilot program).

That said, the project is entirely open source, and you can install it
independently if you want to get a feel for how it all works. 

If you're a journalist or news organization trying to decide if this is right for you,
please note that SecureDrop Workstation should only be used
by organizations that meet the following criteria:

* You have an existing SecureDrop Server in place
* You have fewer than 500 Sources on the Server
* You typically only interact with .pdf, .doc, and .jpg files via your
  SecureDrop (as opposed to large datasets or complex file formats, which are
  :doc:`not yet supported <supported_filetypes>`)
* You have a functional *Secure Viewing Station* to fall back on
* Your journalists and support staff are comfortable trying a new operating
  system (Qubes OS), and are aware that they may need to troubleshoot with us
  or with your internal tech team if issues arise
* Your journalists don't rely on the features that are :doc:`not yet implemented <known_issues>`

If you do not meet the criteria above, you are likely to run into
difficulties or frustrating experiences using the Workstation, and should
consider waiting until it is more mature.

.. warning::
   In its current state, if you have more than 500 Sources on your server
   you **will** experience significant performance issues using SecureDrop
   Workstation that may hinder your ability to use it at any functional
   level.

SecureDrop Workstation Feature Comparison
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SecureDrop Workstation provides a faster and more streamlined way of interacting
with sources and submissions, while preserving important security properties.
That said, it is still under development, and not all features available on the
Tails-based (existing) system are available in SecuredDrop Workstation. We are
working towards feature parity, but in the meantime, there are some notable differences;
see the :doc:`known_issues` page for more information.


Do you still need a Tails-based *Secure Viewing Station*?
---------------------------------------------------------

For now, yes. There are still circumstances where the SecureDrop Workstation
may not be able to retreive or show submissions. The main instances are
either in situations where there are a substantial number of sources or
submissions stored on the SecureDrop server, or in instances were you are
trying to open a file type that the Workstation is not yet equipped to handle.

Once SecureDrop Workstation is more mature, you will be able to use it to view
most submissions, but for now, having the *Secure Viewing Station* available
as a backup is imperative.

Roadmap and Timeline
--------------------

You can find information about our current development roadmap and timeline at
the `SecureDrop Development Wiki <https://github.com/freedomofpress/securedrop/wiki/Development-Roadmap>`_.

We encourage former pilot participants and open beta participants to file support tickets
with us, to help us understand and prioritize your needs as we continue development.

