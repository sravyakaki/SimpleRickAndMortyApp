# SimpleRickAndMortyApp
A simple Rick and Morty app that uses the RickAndMorty API as it's backend to display the characters in a scrollable collection view. Selecting a character in the "Characters" screen will take the user to the secondary screen. The secondary screen displays the image and name of the selected character in the title of the navigation bar.

## Technical Details
* Compiles with Xcode 11.6 and Swift 5.1
* Design Pattern followed - MVC architecture
* Used Swift Codable for parsing JSON data
* In Memory image caching mechanism used for caching the character images in the characters view controller 
* Basic Unit and UI test cases added to achieve test harness

## Note
No additional setup required as app does not use any dependancy managers
