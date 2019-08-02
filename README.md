# Photo Frame

A zero-UI iPad app to display a photo slideshow from a shared iCloud Photo Stream.

### Why?

I had an old iPad that I wanted to mount in a photo frame. It would be behind glass, so the touchscreen would not work and the home button would be inacessible. I wanted the end result to look like a backlit printed photo, not an ipad in a frame.

This meant that most photo frame apps were not suitable. I needed something that:

- Works with an iCloud shared photo album
- Updates automatically as photos are added and removed
- Scales and crops photos to fill the screen
- Starts showing photos on launch with no UI
- Supports retina screens
- Supports showing each photo for 30 minutes
- Can run for months – hopefully years – with no intervention

### Setup the iPad

1. Setup an iCloud account, turn off notifications and auto-brightness, set auto-lock to never, enable guided access.
1. Create a shared photo album called "Photo Frame" and invite the iPad to it.
1. Connect your iPad and deploy the app, granting access as required.
1. Triple-click the home button to turn on guided access, turn sleep/wake button on and everything else off.

The app re-scans your shared album on each image change, so new additions to the photo stream will be picked up automatically.

### Mount the iPad in a frame
iPad mounted in the frame with 6x6mm strip wood glued to mount board to hold it in place. Plug has been stripped down to reduce size.
![iPad mounted in a frame](https://raw.githubusercontent.com/davidjamesmoss/photo-frame/master/docs/build_1.jpg)

With back panel in place. I made a hole to access the sleep/wake button so that the screen can be turned off if you need to darken the room. Guided access will take you back into the app without needing to unlock the screen. 

The back is held in place with two L brackets screwed to the bottom inside edge of the frame and a single bracket screwed in place at the top.
![Back panel](https://raw.githubusercontent.com/davidjamesmoss/photo-frame/master/docs/build_2.jpg)

Finished result. Lots of reflections in this photo, but it looks great indoors where there is no direct light on it.
![Finished result](https://raw.githubusercontent.com/davidjamesmoss/photo-frame/master/docs/build_3.jpg)

### Problems?
This was only tested with an iPad 3 running iOS 9, the code has no error handling, and I spent longer writing this readme than the app, so good luck!
