SecureDrop Workstation Project Status
=====================================

SecureDrop Workstation is currently in active development, and has not yet
had a stable release.

The 1.0.0 general availability release is tentatively planned for TBD.

Freedom of the Press Foundation has operated a pilot program with a limited
number of organizations whose environments were especially well-suited for
early testing of the Workstation. This pilot program is now closed. No new
pilot participants will be considered or accepted, and current pilot
participants can expect to transition to the standard support experience
before the general availability release is made available later in 2024.


Is SecureDrop Workstation right for you?
----------------------------------------

Until SecureDrop Workstation reaches general availability, we would
recommend against using it in production environments (outside of users
who have already installed it as part of the pilot program).

That said, the project is entirely open source, and you can install it
independently if you want to get a feel for how it all works. 

If you're a journalist or news organization trying to decide if this is right for you, please note that SecureDrop Workstation should only be used
by organizations that meet the following criteria:

* You have an existing SecureDrop Server in place
* You have fewer than 500 Sources on the Server
* You typically only interact with .PDF, .DOC, and .JPG files via your
  SecureDrop
* You have a functional *Secure Viewing Station* to fall back on

If you do not meet the criteria above, you are likely to run into
difficulties or frustrating experiences using the Workstation, and should
consider waiting until it is more mature.

.. warning::
   In its current state, if you have more than 500 Sources on your server
   you **will** experience significant performance issues using SecureDrop
   Workstation that may hinder your ability to use it at any functional
   level.

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

While not a comprehensive or exhaustive list of the things the SecureDrop
Team will be working on, the following is a rough roadmap of the upcoming
work planned for the next three-to-six months:

* SecureDrop Server 2.8.0 Release
* SecureDrop Workstation 0.9.0, featuring improvements to the export workflow,
  including VeraCrypt support
* A point release for Whonix from version 16 to 17
* SecureDrop Workstation 1.0.0, featuring Qubes 4.2 compatibility

Aside from upstream end-of-life (EOL) dates, there are not any concrete
release dates for the upcoming stable releases of SecureDrop Workstation.
That said, the following timeline is a rough estimate of when we expect to
reach various milestones within the project:

* TK: SecureDrop Workstation 1.0.0 available
* TK: Assisted reinstalls of SecureDrop Workstation for
  pilot participants
* TK: Pilot program ends, pilot participants transition to the
  official SecureDrop Support Portal (Redmine)

General availability
--------------------

When SecureDrop Workstation reaches general availability in mid-2024, any
organizations who have used a previous version of SecureDrop Workstation
will need to perform a complete reinstallation of Qubes 4.2 and the
SecureDrop Workstation.
