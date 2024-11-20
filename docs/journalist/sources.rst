Communicating with sources
==========================

SecureDrop Workstation lets journalists check SecureDrop, decrypt and securely
view submissions, and reply to sources, all on the same computer.

Once logged in, you will see a chat-like user interface:

- The leftmost panel shows your username, if you are logged in, or the
  sign-in button.

- The middle panel holds the list of sources that have submitted to your
  instance. Each source is identified to you with a two word pseudonym.

- The rightmost panel holds the conversation view. All parts of the conversation
  with a specific source (messages, files, and journalist replies) will be
  displayed here.

- The top panel holds a toolbar that allows you to apply actions to multiple
  sources at once. (Currently, "Delete Sources" is the only supported action.)

- The bottom status bar will alert you to any problems (such as lack of network
  connectivity or issues downloading a file).

Opening a conversation
----------------------

To display a conversation in the conversation view, simply click a source in the
source list.

|screenshot_sdapp_main_view|

Journalists sending replies are assigned different colors and identified with
their initials. Move your mouse pointer over the initials to reveal the full
name.

.. note:: When you are prompted by a dialog that says “Do you allow VM
   'sd-app' to access your GPG keys (now and for the following 28800
   seconds)?”, click **Yes**. This allows the SecureDrop Application VM access
   to the secure VM that holds your SecureDrop Submission Key.

Highlighting conversations
--------------------------

You can highlight important conversations by clicking on the star beside a
source's name. Starred sources will be visible as starred to everyone in your
organization.

Sending a reply
---------------

Compose a reply to the selected source in the text box at the bottom of the
conversation view. Click the paper airplane icon or press "Ctrl+Enter" to send
a reply. Any replies you did not send will be discarded when you exit the
client.

|screenshot_send_reply|

Deleting conversations
---------------------- 

Deleting a single conversation
''''''''''''''''''''''''''''''

You can delete a single source conversation by clicking on the three dots at
the top right-hand side of the application window, beside the timestamp. You should
see a dropdown menu with two options: **Files and messages** and **Entire source
account**. In both cases, a confirmation dialog will appear before anything is
deleted.

|screenshot_deletion_dropdown|

Click **Files and messages** to delete all files and messages (including journalist
replies) associated with this source, while keeping the source account active.
The source will continue to appear in the source list, and will be able to
communicate with you through the Source Interface.

Click **Entire source account** to also remove the source from the source list,
and to prevent them from logging into the Source Interface. Their account will
be completely removed from the system.

.. |screenshot_sdapp_main_view| image:: ../images/screenshot_sdapp_main_view.png
  :width: 100%
.. |screenshot_send_reply| image:: ../images/screenshot_send_reply.png
  :width: 100%
.. |screenshot_deletion_dropdown| image:: ../images/screenshot_deletion_dropdown.png
  :width: 100%


Deleting multiple conversations
'''''''''''''''''''''''''''''''

You can also delete multiple source conversations at once. Hold down the Control
(Ctrl) key and click on different rows to select (or deselect) sources from the list.
(You can also Ctrl + drag the mouse, or Shift + select, to select a range of continuous
sources.) Once you are finished selecting, click the "Delete Sources" toolbar button.

.. |screenshot_select_sources|  image:: ../images/screenshot_delete_sources_select.png
  :width: 100%

This action deletes the **entire source account**, meaning files and messages will
be removed, and that source will no longer be able to log in using their codename.

You will be shown a confirmation dialog before any sources are deleted. If you select
a very large number of sources, you will also notice a brief time delay, to prevent
unintentional deletion.

.. |screenshot_confirm_delete|  image:: ../images/screenshot_delete_sources_dialog.png
  :width: 100%
