# SOTA Watch Logger
An app to keep track of your sota contacts and points

## Getting Started
To begin run `ruby bin/run.rb` from the terminal. This will begin the execution loop

### Main menu

Comands you can run from the main menu

* ```activate: operate as an activator ```

   This will change your operator mode to activating and allow you to enter the Activator menu, you will be prompted to select a summit to activate and an operating frequency. SOTA Logger will then create a spot and post that to Sotawatch.org for others to contact you

* ```chase: operate as a chaser```
   This will change your operator mode to chasing and enter the Chasing menu. You will be presented with recent SOTA spots that may be of interest.

* ```points: view a users SOTA points ```

   Calculate the current user's Activator and Chaser points based on stored contacts.

* ```help: print this message ```

   Display a short help message

* ```spots: view current spots from activators ```

   Fetch recent spots from the SOTA Watch website and display them in a formated list

* ```settings: change your user settings```

   Enter the settings menu to adjust number of spots to display and which spots are displayed

* ```user: load or change users```

   Enter the callsign you would like to use to operate under. If the callsign is not in the users database you should create a new profile using `new`

* ```users: list all current users ```

   Lists the Names, call signs and Grid squares for all users in the database

* ```delete user: delete current user profile ```

   Delete the profile that is currently loaded
