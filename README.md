# Grip-x-Pokémon
Repository for the iOS App developed by Joseph Williams for the take-home test/coding challenge for GRIP Application. I chose to write the logic in Swift and the views in SwiftUI to demonstrate the capabilities of the latest technologies, hopefully, something that refactoring from Obj-C to Swift will enable Grip to do.

## Implementation
## UI Architecture Patern
I chose to implement an MVVM Design Architecture for this challenge with the two main views (Initial (List) & Detail View (Pokémon)). 

### Pros:
- Decoupling logic from the UI to enable in-depth unit testing
- De-clutter view code

### Cons:
- Design architecture requires additional files and work to setup

## The Pokémon API
Once I read the documentation for the API https://pokeapi.co it was clear that there is abundance of information available and I encountered a new format of response in the form of Paginated Responses. New experiences aside, I found that the documentation included some Wrapper Libraries that had been produced in different programming languages. So I decided to implement the Wrapper library produced here (https://github.com/kinkofer/PokémonAPI) as a package in this application.

### Pros:
- Reducing time-spent re-creating data objects work that has already been done
- Demonstrates my ability to work with Swift Package Manager
- Implemented Asynchronous methods to make use of the device's background threads to complete the API requests

### Cons:
- The data objects, which are extensive, are built using classes, I think a better implementation would have been to use structs
- I couldn't add a static `example` to each data object which would have been useful for prototyping the UI
- All types were declared as Optionals which meant a lot of unwrapping and providing default values for the Views
- To get the data in a format I could deal with in a List View I had to add a query to the initial `fetchPokémonList()` so that it returned all 1000+ Pokémon in the first page (I haven't had previous experience with paginated responses)

### Note
If I were to do the challenge again I would happily of demonstrated the ability to use `URLSession` or use Alamofire (another URLRequest library) to get responses from the API.

## Internet only App
The application currently doesn't implement any logic to store the data locally (on-device) retrieved from the API requests for the initial or detailed Pokémon view.

### Pros:
- Application size is small
- App will show latest data from the API (currently no way to track any changes made in the API)
- Easy to implement an enum to switch views based on the status of the Asynchronous methods

### Cons:
- User gets a bad experience when using the App with poor or no internet connection
- The current implementation will show Charmander as a default rather than an anonymous avatar when a Pokémon object has sprites that are null

# Personal Review
Overall, I feel the application does what is required by the brief giving a user an ability to look at the vast amount of Pokémon and then finding out more detail when they select one from a list. Using native components means the app responds to system settings such as Light/Dark mode and adjusts UI accordingly. However, there is always room for improvement and therefore if I were to take this to v2 I would implement the following:

## Add a CoreData Model
- So that users would be able to use the app without internet after an initial set of requests
- Save the list of Pokémon and then either create a data object for each Pokémon when they select one from the list adding it to the model, 
- Or asynchronously fetch the data from each Pokémon request after the initial `fetchPokémonList()`

A CoreData Model should then enable me to do the following

![v2.0.0 ListView](https://github.com/joemdwills/Grip-x-Pokemon/blob/develop/README-Assets/v2%20List%20View.png?raw=true "Desired v2.0.0 ListView")

## Search Field (by name or type)
Adding the ManagedObjectContext to the List view would enable me to query the data model with by either the Pokémon Name or by Type, giving the user a better experience.

## More detail for each row object in the list
The current list view is very boring and pretty impossible to identify Pokémon quickly. Adding an image, type and ID to each row would give the user just enough detail so that it makes journey of finding a specific Pokémon, quicker.
