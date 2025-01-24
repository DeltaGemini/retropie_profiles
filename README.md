# Retropie User Profiles

![RetropieProfiles](https://github.com/user-attachments/assets/4f4f69af-7912-4c02-bff5-10795e53e7ea)

Create player profiles for Retropie and Emulationstation

I'm trying to get my kid into retro games with the Retropie which is all good and fun until they want to save their progress. Now I have to manually rename save files, backup save states etc etc etc.

But what if there was an easier way?

**INTRODUCING** Player Profiles!

This is pretty barebones, but this will create a new "system" in EmulationStation where instead of games, you have player profiles you can switch to.

I don't have time to make this easy to use or pretty, but my basic code is included.

Essentially, it works this way:
1) In your save and savestate folders, create a subfolder for each player profile. Remember the name you used, this is your profile name.
2) Add a Profile Switcher system to es_systems.cfg:

  <system>
      <name>profile_switcher</name>
      <fullname>Profile Switcher</fullname>
      <path>/opt/retropie/configs/all/emulationstation/scripts/profiles</path>
      <extension>.sh .SH</extension>
      <command>%ROM%</command>
      <platform>profile_switcher</platform>
      <theme>profile_switcher</theme>
  </system>

3) Create the folder "profiles" in /opt/retropie/configs/all/emulationstation/scripts/
4) In this folder, put the "Guest.sh" script from this repository. Duplicate and rename this script to your chosen user profile name. Inside the file, change the folder names and profile names to match your chosen save folder.
5) SSH into your Retropie. We need to turn this .sh file into a executable script. Do this by:
     chmod +x /opt/retropie/configs/all/emulationstation/scripts/guest.sh (Change the filename to match your own)
7) Restart EmulationStation.
8) Go to Profile Switcher and select your profile.

The script will then cycle through every retroarch.cfg file in each system and change the directories for your cores' save and savestates folder to the child folders you created earlier.

**Theme support**
This is the code I've added to the Switch theme.xml file for adding profile images:

		<image name="user" extra="true">
            <path>/home/pi/RetroPie/profiles/photos/current.png</path>
            <size>0.075 0.137</size>
			<pos>0.025 0.03</pos>
    </image>

