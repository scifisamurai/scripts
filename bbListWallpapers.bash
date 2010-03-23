#!/usr/bin/env bash

#Author: David T. Harris http://twitter.com/scifisamurai
#Description: This script is to meant to be used as a pipe menu script for the
# 		Blackbox Window Manager.  It generates a submenu of the
#		main blackbox menu.  This submenu will contain one entry
#		for each wallpaper/background in the user's 
#		wallpapers/backgrounds directory.
#Prerequisites: In order to use this script you need the following:
#		1. The blackbox window manager
#		2. A commandline program that can set your root 
#		wallpaper/backround like feh or Esetroot.
#		3. A directory that holds your wallpaper/background images
#Installation:  1. Download this file and place it in a convenient location.  
#		I recommend using your .blackbox directory in your home
#		directory.
#		
#		2. Execute the following command to enable 
#		this script to execute:
#
#		chmod 700 bbListWallpapers.bash 
#
#		3. Place something like the following in your blackbox menu file
#		(just remember to change /home/myUserName/.blackbox/ to
#		the actual fully qualified path to where you placed this file):
#
#		[include] (|/home/myUserName/.blackbox/bbListWallpapers.bash)
#
#		This command will execute this file & create the
#		Wallpapers submenu.
#Debugging: 	You can execute the script manually after you've done step
#		2 in the installation instructions above by doing the 
#		following: 
#		1. In a terminal/command line window, navigate to where the
#		you put the file
#		2. Execute the file by doing the following:
#		./bbListWallpapers.bash
#		You should now see the submenu that is generated 
#		for blackbox to use.

#The fully qualified path to the directory holding your
#wallpapers/backgrounds.
WALLPAPER_DIRECTORY=${HOME}/.Walls

#A list of file extentions for your backgrounds/wallpaper images.
FILE_EXTENSIONS=".jpg .png"

#The program you want to execute to set your background/wallpaper.
COMMAND="feh --bg-scale"

#Build out the menu entries in our pipe menu
#
#These follow the standard menu convention for blackbox:
#[exec] (name as seen in menu) {command to execute when menu option is clicked}
echo "[submenu] (Wallpapers)"
for extension in $FILE_EXTENSIONS;
do
	for wallpaper in $(ls ${WALLPAPER_DIRECTORY}/*$extension ) ; 
	do
		echo -en "\t[exec] ("`basename ${wallpaper%%$extension}`")"
		echo " {$COMMAND $wallpaper}"
	done
done
echo "[end]"
