# README
#My Climb Dashboard
My Climb Dashboard is an application to help users log quantifiable progress with their climbing training journey. 

###Features
There are three factors that users can log to track their progress or document their journey.

-Users may log routes that they have completed so they can see and track all climbs they have completed,
    currently the user can see the hardest climb they have completed and their most difficult flash 
    (a flash is when a climb is completed on the first attempt). In order to add more climbs to the 
    database, a user must be an admin which can be configured on the user's profile 

-Users can log different parts of their hangboard exercises. Hangboarding is a common technique used 
    in climbing training when a user will hang from a structure that has a variety of holds that are 
    different shapes and sizes. Logging the change of weight and intensity with these holds, is one 
    of the best and most quantifiable ways to log strength progressions in rock climbing. There will 
    be more features added here later. Largely to assign "scores" to these workouts to see progress 
    and to add graphs for more visual feedback

-Users can create posts where other users can comment. This is designed for users to be able to share
    what aspects of their training has been successful and what has not. 

###Installation
To use and install my climb dashboard, first clone and download this repository then navigate to the repository in your terminal. Then run 
```bundle install```
to install the approprite gems. Finally run 
```rails s```
to start the server. If you navigate to localhost:3000, you should be able to use My Climb Dashboard  
