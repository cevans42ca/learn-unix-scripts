# learn-unix-scripts
A set of bash scripts for teaching Unix in general in an interactive way

This project is in alpha status.  I am requesting comments to help shape it into something useful to many people.

I have broken down a series of critical Unix skills into belts that match my taekwondo school's progression.  I have a roadmap set down from white belt to black belt, but only about half of the exercises are complete.

I will use the term "student" loosely to refer to someone who wants to use these scripts to learn Unix concepts and programs.

There is nothing hidden or encrypted in this project.  The project only contains bash scripts and documentation.  The included scripts are more suited to a corporate environment where a measure of trust on behalf of students is implied or expected, and/or where an audit of the scripts is required or desired.  Students adept at Unix have many possible ways to give themselves a belt they didn't earn.  Indeed, finding possible ways to do so also represents understanding of Unix and should be encouraged, as long as students don't misrepresent their knowledge or completion of the exercises.

If you plan on using these exercises in a classroom setting, you will need to include traditional testing in order to confirm understanding, or you might consider a project with different goals, such as GameShell.  (Disclaimer:  I have no experience with GameShell and don't have a personal or professional relationship with any of the team members.)

# Try them Out in Docker

If you want to try these scripts out in a Docker container, and you have Docker installed, you can use the following commands to set up a volume to save your progress and run them.

## Setup commands:  Run them Once
	docker volume create lus
	docker run --mount src=lus,target=/mnt/vol -u 0 alpine /bin/ash -c 'mkdir -p /mnt/vol/testuser;chgrp 1000 /mnt/vol/testuser;chmod g+w /mnt/vol/testuser'

## Work with traditional white text on black terminal settings
	docker run -it --rm --mount src=lus,target=/mnt/vol cevans42ca/learn-unix-scripts

## Work with black text on white
	docker run -it --rm --mount src=lus,target=/mnt/vol --env DARK_MODE=0 docker run -it --rm cevans42ca/learn-unix-scripts

# Installing Locally

If you want to run the scripts directly on your own host, clone this repo and run the ./configure script, which will ask you if you want to use Docker.  Follow the prompts from there to set up the scripts to run directly in your environment or create your own site-specific Docker image.

