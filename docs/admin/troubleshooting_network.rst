Troubleshooting network issues
==============================

.. include:: ../includes/top-warning.rst

Before troubleshooting network issues, we recommend reading about the
:ref:`networking architecture <Networking Architecture>`
of SecureDrop Workstation. If you are in a hurry, this guide offers quick
diagnostic and remedial steps.

Step 1: Verify you are connected to the Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use both wireless and wired networks in Qubes. You can manage network
access through the network manager, which you can find in the area populated
with icons in the top right corner of your Qubes desktop.

The network manager looks like this for a wired connection:

[SCREENSHOT: network manager wired icon]

It looks like this for a wireless connection:

[SCREENSHOT: network manager wired icon]

.. note::
   Like most operating systems, Qubes gives you the option to remember any
   wireless network you have previously connected to.

   If Qubes is able to connect to both a wired and a wireless network, the wired
   connection will take precedence, and the network manager icon for a wired
   connection will be shown. However, Qubes may still maintain a wireless
   connection in parallel, and fall back to it if the wired connection is lost.

When a network connection is lost, Qubes will display an alert like the
following:

[SCREENSHOT: lost connection notification]

Common causes for lost connections include fully or partly unplugged network cables,
lost power to networking equipment, and ISP service outages. When you see a lost
connection notification, it is most likely due to one of these causes.

If you are experiencing other connectivity issues, move on to the next step.

Step 2: Troubleshooting login issues
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If the issue occurs on the login screen of the SecureDrop Client (the dialog
with the SecureDrop logo), this may not be a network issue. Make sure that your
username, passphrase, and two-factor code are correct.

.. important::

   After a failed login, wait for a new two-factor code from your app before
   trying again.

You can reveal the passphrase by clicking the "eye" icon next to it in the login
dialog (ensure you are in a fully private setting before doing so). Check for
extra characters at the beginning at the end, or subtle differences like
capitalization.

If you access multiple sites and services using a single two-factor app, make
sure that the correct user account is selected.

If you have access to a Tails-based *Journalist Workstation*, verify whether you
can access SecureDrop using the same credentials that do not work in Qubes.

Step 3: Verify that all required VMs are running
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The following VMs must be running for all actions requiring network connectivity
to work (e.g., logging in, checking for messages, downloading documents, replying
to sources, starring sources, deleting sources):

- ``sd-app``
- ``sd-gpg``
- ``sd-log``
- ``sd-proxy``
- ``sd-whonix``
- ``sys-firewall``
- ``sys-net``
- ``sys-whonix``

You can verify whether a VM is running or not by clicking the "Q" icon in the
top right corner of your Qubes desktop. Only VMs that are currently running are
listed:

[SCREENSHOT: Q widget with VM list expanded]

If a required VM is not running, you can launch it from the Qube Manager. Open
the Qube Manager by clicking **Open Qube Manager** in the menu above. A window
like the following should appear:

[SCREENSHOT: qube manager screenshot]

To start a VM, select it from the list and press the "play" button in the
toolbar.

In ordinary operation, VMs should start when they are needed. If you repeatedly
experience problems with a necessary VM not running, or if an error message
is displayed when attempting to start the VM, please contact us for assistance.

If this does not resolve the issue, proceed to the next step.

Step 4: Verify that required VMs have connectivity and examine logs
-------------------------------------------------------------------

Step 5: Restart Tor
-------------------
If all required VMs are running, you may be experiencing issues with the Tor
network. You can check the Tor status and try restarting Tor.

To do so, right-click the Tor icons in the top right corner of your Qubes
desktop. They look like this:

[SCREENSHOT: sdwdate-gui widget]

One of the two icons should display the option **sd-whonix**. Select that option
from the menu with your mouse, and then click **Tor control panel**:

[SCREENSHOT: sdwdate-gui widget with Tor control panel option shown]

You should now see the following dialog:

[SCREENSHOT: Tor control panel screenshot]

Click **Restart Tor** in the bottom right of this dialog. You should see a
progress bar which will indicate when Tor is available again. If this does not
resolve the issue, proceed to the next step.

Step 6: Restart ``sd-proxy`` and ``sd-whonix``
----------------------------------------------
The VMs ``sd-whonix`` and ``sd-proxy`` are the two most important VMs for
maintaining the connection between the SecureDrop app and the SecureDrop server.
You can restart VMs using the Qube Manager:

[SCREENSHOT: Qube Manager screenshot]

Select the VM you wish to restart from the list, right-click its entry, and click
**Restart qube**. (You can also click the restart icon in the toolbar instead.)
This will take several seconds, and it will take additional time to re-establish
a Tor connection.

If this does not resolve the issue, proceed to the next step.

Step 7: Restart ``sys-net`` and ``sys-firewall``
------------------------------------------------
Using the same method employed in the previous step, you can restart the two
VMs that are underlying most network operations in Qubes OS, ``sys-net`` and
``sys-firewall``.