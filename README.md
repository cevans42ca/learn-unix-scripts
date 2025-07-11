# learn-unix-scripts
A set of bash scripts for teaching Unix in general in an interactive way

This project is in alpha status.  I am requesting comments to help shape it into something useful to many people.

Although this project uses bash exclusively, only a few exerices focus on it specifically, making it straightforward to adjust the exercises to work with other shells.  Bash can be installed nearly everywhere.  It also has consistent keybindings that work in everything from Docker containers attached in Windows Command Prompt to Terminus running on an iPhone.  It also has access to a command history by default, which is sometimes the only way to verify specific commands have been run.

I have broken down a series of critical Unix skills into belts that match my taekwondo school's progression.  I have a roadmap set down from white belt to black belt.  About 75% of the exercises are complete.  I have ideas about black belt exercises.

In the sections below, I will use the term "student" loosely to refer to someone who wants to use these scripts to learn Unix concepts and programs.

# What is the User Experience Like?

[Show me screenshots!](main/screenshots/README.md)

Students run the "learn" script, which shows the student the current lesson.  The scripts format the text for the student's terminal and use "less" as a pager.  "Less" is required as the prompts are customized.  Each exercise asks the student to do something.  The student then sources the check script with ". check" (the first lesson guides the student in that).  If they need to step away, they run "learn" again the next time they're connected.

A terminal of 100x30 is recommended, though an 80x24 terminal won't have much text getting improperly wrapped (in the middle of words).  It's possible to use Terminus on iPhone to connect to a server where the scripts are installed and use the 61x28 terminal that Terminus provides in portrait mode, but there are some issues with improperly wrapped text, and scrolling may be required on occasion.

# Security

There is nothing hidden or encrypted in this project.  The project only contains bash scripts, Makefiles, one perl script that's used if grep -P doesn't work, and documentation.  The included scripts are more suited to a corporate environment where a measure of trust on behalf of students is implied or expected, and/or where an audit of the scripts is required or desired.  Students adept at Unix have many possible ways to give themselves a belt they didn't earn.  Finding possible ways to do so also represents understanding of Unix and should be encouraged, as long as students don't misrepresent their knowledge or completion of the exercises.

If you plan on using these exercises in a classroom setting, you will need to include traditional testing in order to confirm understanding, or you might consider a project with different goals, such as GameShell.  (Disclaimer:  I have no experience with GameShell and don't have a personal or professional relationship with any of the team members.)

# Try them Out in Docker

If you want to try these scripts out in a Docker container, and you have Docker installed, you can use the following commands to set up a volume to save your progress and run them.

The following commands are for a standard Docker installation.  [Click here](#Try-the-Scripts-out-with-a-Rootless-Docker-Setup-or-Podman) if you have a rootless Docker setup or Podman.

### Setup Commands:  Run them Once
	docker volume create lus
	docker run --mount src=lus,target=/mnt/vol -u 0 alpine /bin/sh -c "mkdir -p /mnt/vol/testuser;chgrp 1000 /mnt/vol/testuser;chmod g+w /mnt/vol/testuser"

### Run this one if you have "traditional" white text on black terminal settings
	docker run -it --rm --mount src=lus,target=/mnt/vol cevans42ca/learn-unix-scripts

### Run this one for black text on white
	docker run -it --rm --mount src=lus,target=/mnt/vol --env DARK_MODE=0 cevans42ca/learn-unix-scripts

# Installing Locally

If you want to run the scripts directly on your own host, clone this repo and run the ./configure script, which will ask you if you want to use Docker.  Follow the prompts from there to set up the scripts to run directly in your environment or create your own site-specific Docker image.

# Try the Scripts out with a Rootless Docker Setup or Podman

The following commands are for a rootless Docker installation or Podman.  If you have a standard Docker installation, [click here](#Try-them-Out-in-Docker).

### Setup Commands:  Run them Once
	docker volume create lus
	docker run --mount type=volume,src=lus,target=/mnt/vol --userns=keep-id alpine /bin/sh -c "mkdir -p /mnt/vol/testuser"
	docker run --mount type=volume,src=lus,target=/mnt/vol -u 0 alpine /bin/sh -c "chmod ug+w /mnt/vol/testuser"

### Run this one if you have "traditional" white text on black terminal settings
	docker run -it --rm --userns=keep-id --mount type=volume,src=lus,target=/mnt/vol cevans42ca/learn-unix-scripts

### Run this one for black text on white
	docker run -it --rm --userns=keep-id --mount type=volume,src=lus,target=/mnt/vol --env DARK_MODE=0 cevans42ca/learn-unix-scripts
