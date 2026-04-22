Communicating with sources
==========================

SecureDrop Workstation lets journalists check SecureDrop, decrypt and securely
view submissions, and reply to sources, all on the same computer.

Once logged in, you will see a chat-like user interface:

- The top of the left panel shows your username, if you are not working in offline mode. Clicking your username shows the menu, which lets you intiate a sync with your SecureDrop Server, get help, sign out, or 

.. TODO screenshot of the menu
  
- The action area of the left panel provides the ability to search submissions, star sources, select multiple sources, delete sources, toggle sort order, and filter the source list. 

- The larger portion of the left panel holds the list of sources that have submitted to your
  instance. Each source is identified to you with a two word pseudonym. You will also
  see the date of the last source activity, an icon to indicate if a source contains attachments,
  and a button to mark a source as starred.

- The right panel holds the conversation view. All parts of the conversation
  with a specific source (messages, files, and journalist replies) will be
  displayed here.

Opening a conversation
----------------------

To display a conversation in the conversation view, simply click a source in the
source list.

|screenshot_sdapp_main_view|

Replies from other journalists in your organization show up in the conversation, and are identified by the journalist's name.

.. note:: When you are prompted by a dialog that says “Do you allow VM
   'sd-app' to access your GPG keys (now and for the following 28800
   seconds)?”, click **Yes**. This allows the SecureDrop Inbox VM access
   to the secure VM that holds your SecureDrop Submission Key.

Highlighting conversations
--------------------------

You can highlight important conversations by clicking on the star beside a
source's name. Starred sources will be visible as starred to everyone in your
organization.

Sending a reply
---------------

Compose a reply to the selected source in the text box at the bottom of the
conversation view. Click the **Send** button or press "Ctrl+Enter" to send
a reply. Any replies you did not send will be discarded when you move to a
different conversation.

|screenshot_send_reply|

.. note:: If a reply fails to be sent successfully, it will still be visible in
  subsequent sessions, including to any other users logging into the same
  physical SecureDrop Workstation.

Deleting conversations
----------------------

Deleting conversations
''''''''''''''''''''''''''''''

You can delete a single source conversation checking the box beside the Source name in the list, then clicking the delete button (as indicated by a trash icon) in the action area at the top.

|screenshot_delete_sources_select|

You will be presented with a pop-up where you will be asked to confirm if you would prefer to **Delete Conversation** or **Delete Account**.

|screenshot_confirm_delete|

Click **Delete Conversation** to delete all files and messages (including journalist
replies) associated with this source, while keeping the source account active.
The source will continue to appear in the source list, and will be able to
communicate with you through the Source Interface.

Click **Delete Account** to also remove the source from the source list,
and to prevent them from logging into the Source Interface. Their account will
be completely removed from the system.

.. |screenshot_sdapp_main_view| image:: ../images/screenshot_sdapp_main_view.png
  :width: 100%
.. |screenshot_send_reply| image:: ../images/screenshot_send_reply.png
  :width: 100%
.. |screenshot_confirm_delete|  image:: ../images/screenshot_delete_sources_dialog.png
  :width: 100%
.. |screenshot_delete_sources_select|  image:: ../images/screenshot_delete_sources_select.png


Deleting multiple conversations
'''''''''''''''''''''''''''''''

To delete multiple conversations or accounts, select more than one source
conversation from the list, then click the delete button. You will be
presented with the same options to **Delete Conversations** and
**Delete Accounts** as you would with a single source conversation.

Searching and Filtering
-----------------------

You can search through the text of all conversations and source pseudonyms using the search bar at the top of the source list. This will not search for text inside submitted attachments. 

.. TODO Screenshot Search

To filter the list of conversations, use the dropdown. You can filter the conversation list to show only unread or starred conversations. 

.. TODO Screenshot Filter

The list of conversations can be sorted newest-to-oldest or oldest-to-newest. Change the sort order by clicking the sort toggle.

.. TODO screenshot sort toggle

Syncing
-------

Unless you are in :ref:`offline mode<Offline mode>`, SecureDrop Inbox will automatically sync with your SecureDrop Instance every time you send a reply, or every 60 seconds. Syncing also fetches new messages sent by sources or other journalists in your organization. You can initiate a sync manually from the menu or by typing "Ctrl+S". 

The sync indicator will be green if the last sync was successful. If the sync indicator is orange, it means the most recent sync failed or did not complete properly. If your SecureDrop Inbox is repeatedly unable to sync, you can try :doc:`troubleshooting the network connection</admin/reference/troubleshooting_connection>` on your SecureDrop Workstation or contacting your admin for help. 

.. TODO screenshot of sync indicator