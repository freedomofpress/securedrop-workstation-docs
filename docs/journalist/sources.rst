Communicating with sources
==========================

.. include:: ../includes/top-warning.rst

SecureDrop Workstation lets journalists check SecureDrop, decrypt and securely
view submissions, and reply to sources, all on the same computer.

Once logged in, you will see a chat-interface-like screen, showing all of your
sources in the middle panel. Each source is identified to you with a two word
pseudonym.

Opening a conversation
----------------------

Clicking on a source will display their messages to you in the righthand panel.
Replies that you or anyone from your organization has sent will also appear in
the conversation flow.

.. note:: If you are prompted by a dialog that says “Do you allow VM ‘sd-app’
   to access your GPG keys (now and for the following 28800 seconds)?”, click
   **Yes**.

Highlighting conversations
--------------------------

You can highlight important conversations by clicking on the star beside a
source's name. Starred messages will be visible as starred to everyone in your
organization. In SecureDrop Workstation, message filtering is not yet
available, but if you log into the *Journalist Interface* in classic
SecureDrop, you will be able to filter by starred messages.

Sending a reply
---------------

Compose a reply to the selected source in the text box at the bottom of the
screen. You may send it, or leave it in the box without sending to save it as a
draft.

Sources without reply keys
~~~~~~~~~~~~~~~~~~~~~~~~~~

If the reply box for a source is grayed out, this may mean that a public key
was not properly generated for them at their last login. This means that you
will be unable to reply to them until they have logged in again.

Deleting a conversation
-----------------------

You can delete a source conversation by clicking on the three dots at the top
righthand side of the application window, beside the timestamp, and clicking
"Delete source account".

.. important:: Deleting a source conversation deletes the conversation for
   everyone at your organization, and also prevents the source from logging in
   again using this codename.
