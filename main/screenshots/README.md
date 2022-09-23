If you came to this page first, you might be interested in the [project overview](../../README.md).

This project runs on a variety of operating systems and configurations.  The scripts can also handle small terminal sizes (smaller than 80 columns) though the text may wrap in certain cases.

The first screen shown to the student describes and demonstrates how the material will be presented.  It tries to cover everything the student might see depending on their terminal size.  The first screenshot is from Cygwin running on Windows 10.  Newer versions of Cygwin require ncurses and tput.  It's not particularly pretty output.  In fact, it's a dancing bear.  

> The marvel is not that the bear dances well, but that the bear dances at all.

&mdash; Russian proverb

![A screenshot of the very first screen the user sees](./Welcome-Cygwin-Windows-10.png?raw=true)

The second screenshot is what the user sees after pressing "q".  It's from Terminus on an iPhone (with the Pro theme) connected to an Ubuntu server running in AWS.

<p align="center">
<img src="./Terminus-iPhone-Welcome-Beginner.png" alt="Beginner Material Summary" width="600"/>
</p>

The third screenshot shows an overview of the material for the advanced belts.  It's from WSL 2 in Windows 10 running Ubuntu 22.04 LTS.

![Advanced Material Summary](./WSL-2-Welcome-Advanced.png)

The next screenshot shows an SSH connection from Mac OS X to a FreeBSD instance in AWS.  FreeBSD doesn't have full colour support as it has a different version of tput.  The scripts can also run directly on Mac OS X or on Mac OS X through Docker.

![Screenshot of FreeBSD](./Mac-OS-X-Terminal-SSH-to-AWS-FreeBSD.png)
