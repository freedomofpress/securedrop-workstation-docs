Starting the SecureDrop Client
==============================

.. include:: ../includes/top-warning.rst

Double-click on the **SecureDrop** desktop shortcut to launch the SecureDrop
Client application.

.. | screenshot_desktop-shortcut|

Performing updates
------------------

When you launch the application, it will first check for security
updates. This can take several minutes.

.. | screenshot_check_updates |

If updates are found, you will be asked to apply them before launching the
SecureDrop Client. You have the option of completing this now, or at another
time. Keep in mind that updates are important to security, and you should apply
them the same day you receive the notification.

.. important:: When you click "Apply Updates," allow the update
   process to complete fully, without closing or interrupting it, or you risk
   breaking important system components. The update process may take some
   time.

.. | screenshot_apply_updates |

Once the update process has been completed, the SecureDrop Client will launch.

Signing in
----------

To sign in, enter the username and passphrase provided to you by your
SecureDrop administrator, as well as the two-factor code using the method you
have set up. If you have used SecureDrop before, these
are the same credentials that you would use to log in to the Journalist
Interface.

.. | screenshot_sd-app_login |

After signing in, you will be prompted by a dialog that says “Do you allow VM
‘sd-app’ to access your GPG keys (now and for the following 28800 seconds)?”.
Click **Yes.** This dialogue may appear immediately after signing in, or when
you click on a source submission.

.. | screenshot_gpg_access |

Troubleshooting tips
~~~~~~~~~~~~~~~~~~~~

[This section is a stub]
 - Check your network connectivity if you are having issues with the updater or
   with signing in.
 - You may want to refer to the Qubes documentation to understand the layout,
   toolbars, and menu options you see in Qubes.


Working offline
---------------

Offline mode is available for circumstances where you wish to work offline or
are unable to connect to the SecureDrop servers. In offline mode, any content
that you have previously downloaded will be available. You will not be able to
send or delete messages.

Because SecureDrop Workstation allows you to download and decrypt submissions
on one machine, submissions that you have downloaded are still available in
offline mode and can be accessed even when you are not logged in.

.. important:: Protecting downloaded submissions is another reason why
   SecureDrop Workstation needs to be powered off completely when it is not in
   use.
