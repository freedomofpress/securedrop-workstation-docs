SecureDrop Workstation Project Status


SecureDrop Workstation is currently in active development and is moving
towards general availability later this year.

Freedom of the Press Foundation has operated a pilot program with a limited
number of organizations whose environments were especially well-suited for
early testing of the Workstation. This pilot program is now transitioning to
an open beta program. Current pilot participants can expect to transition to
the standard support experience before the general availability release is made
available later in 2024.

To decide if your organization should be part of the open beta program, consider
the information below and, consult with your internal stakeholders, then contact
Suport.

Is SecureDrop Workstation right for you?
----------------------------------------

If you're a journalist or news organization trying to decide if this is right for you,
please note that SecureDrop Workstation should only be used by organizations that meet
the following criteria:

* You have an existing SecureDrop Server in place
* You have fewer than 500 Sources on the Server
* You typically interact with filetypes such as .pdf, .doc, and .jpg via your
  SecureDrop (as opposed to large datasets or complex file formats,
  which are not yet supported--see below)
* You have a functional *Secure Viewing Station* to fall back on
* Your journalists and support staff are comfortable trying a new operating
  system (QubesOS), and are aware that they may need to troubleshoot with us
  or with your internal tech team if issues arise
* Your journalists don't rely on the features that are not yet implemented
  (see below)

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
That said, not all features available on the Tails-based (existing) system are
available yet in SecuredDrop Workstation. We are working towards feature parity,
but in the meantime, there are some notable differences. The following features
are not yet implemented:

* Download progress/download speed, cancelling downloads
* Network speed indicators
* Searching/filtering sources by codename
* Dynamic rearranging of sources so that starred sources are shown first
* Scalability with large numbers of sources (500+)

In addition, there are some filetypes that are not yet supported for viewing
on SecureDrop Workstation, although they can be exported for use on the Tails-
based Secure Viewing Station.

Currently-supported filetypes include:

* .txt, .csv, .pdf
* Microsoft Word files (.doc, .docx, .xls, .xlsx, .ppt, .pptx)
* OpenDocument files (.odt, .ods, .odp)
* Audio: .mp3, .mp4, .mpeg, .wav, .ogg-vorbis
* Video: .mp4, .webm, .mov (Quicktime), .avi (Audio Video Interleave - Microsoft),
  .wmv (Windows Media Video)
* Image: .gif, .png, .jpeg, .tiff, .svg, .vnd, .webm
* Compressed archives (.zip, .tar.gz), although printer support for files inside
  an archive is still to be implemented

A full list of supported filetypes can be found [here](https://github.com/freedomofpress/securedrop-client/blob/4b7495cf8bd1dc11e2f52fb772fad55aaa01edab/workstation-config/mimeapps.list.sd-viewer).

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
