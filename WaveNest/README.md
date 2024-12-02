# WaveNest - Long Audio Player 

Objective: 

WaveNest is a unique audio player application that provides a dynamic and interactive interface. 
It features a spiral-shaped progress path, a draggable playback marker (red dot), and bookmarks for easy navigation. Users can  also upload their own audio files to play within the app.

## Features:

1. Spiral Progress path
    - Displays the audio progress in a spiral path.
    - Visually interactive and non-linear progress representation.

2. Moving Red Dot 
    - Red Dot denotes the current progress of the audio on the path
    
3. Bookmarks
    - This is denoted by green dots
    - Users can add bookmarks to specific points in the audio for quick access
    - Clicking on a bookmark starts playback from that position

4. Audio Upload
    - Users can upload any audio file to the player and interact with it

5. Persistent Data
    - Saves the last played position and bookmarks locally
    - Resumes playback from the last saved position upon reopening the app
    

## Technologies:

    - SwiftUI - For building the user interface 
    - AVFoundation - For audio playback and management 
    - UserDefaults - For persisting playback state and bookmarks
    
## How it Works? 

Here 4 steps for mainly involved: 

    1. SpiralProgressPath (its a custom path that conforms shape)
        - Generates a spiral path using trigonometric calculations
        - Used to display the progress and bookmarks visually
        
    2. CustomProgressBar (a new view created to show the progess path created in step1)
        - Displays the spiral path
        - Manages the red dot for progress and green dots for bookmarks
        - Allows the red dot to be dragged to jump to specific positions
        
    3. AudioManager ( its a class )
        - Handles audio playback using AVAudioPlayer
        - Tracks playback progress and updates the UI
        - Saves and restores the last played position
        
    4. AudioPlayerView ( main view )
        - Combines the progress bar, play/pause button, and bookmark management into a unified UI
        - Allows users to upload audio files and interact with the progress path
        

## Flow of the Application

1. App:

    - The app loads the saved bookmarks and the last played position using UserDefaults
    - If there is a previously uploaded file, it resumes playback from the last saved position
    
2. Custom Progress Bar:

    - The spiral progress path is drawn 
    - The path fits the screen size by GeometryReader
    - A red dot shows the current playback position
    - Green dots represent the bookmarks added by the user
    
3. Interactivity:

    - Clicking Bookmarks : Clicking on a green bookmark dot sets the playback to that position.
    - Adding Bookmarks: Users can tap the "Add Bookmark" button to mark the current playback position.

4. Audio Playback:

    - Users can play/pause the audio using the central blue button
    - The playback progress updates dynamically, moving the red dot along the spiral path
    
5. Uploading Audio:

    - Users can upload any .mp3 file from their local system
    - The uploaded file replaces the currently loaded audio
    
6. Closing the App:

    - The app saves the current playback position and bookmarks
    - When reopened, it resumes from the saved state
    

