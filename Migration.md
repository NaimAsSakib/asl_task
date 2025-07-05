# Flutter Version Migration

This document describes the process used to downgrade and upgrade Flutter versions for this project.

## Downgrading Flutter to Version 3.0.0

Initially, an attempt was made to downgrade Flutter directly using:
Command as
flutter downgrade 3.0.0
But this command did not work as expected.

To resolve this, Flutter Version Management (FVM) was used to manage Flutter versions more effectively.

# Steps Performed:
Installed FVM via
"fvm install 3.0.0"
"fvm use 3.0.0"

But some issue occurred and I had to specify the path as below and change the environment variable path
"C:\Users\ASUS\AppData\Local\Pub\Cache\bin\fvm install 3.0.0"
But I got error from cmd as " ⚠ You don't have the required priviledges to run this command."
So I had to turn on developer mode from settings.
This creates an .fvm directory and configures the project to use Flutter 3.0.0.

After some efforts I finally downgraded to 3.0.0 and successfully run the project.

## Update Environment Variables
I simply write a command as
"flutter upgrade"
As a result my flutter version upgraded from "3.0.0" to "3.32.5"
Project successfully ran again. 