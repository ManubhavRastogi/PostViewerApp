# PostViewerApp
An app in SwiftUI where the app should fetches posts from an API and allow users to view posts in a list, Search posts, Inspect post, Mark/unmark favourites.

# Project Setup Instructions
    1.    Clone the repository to your local machine.
    2.    Ensure your environment matches the specified iOS and Xcode versions below.
    3.    Build and run on your desired simulator or iOS device.
    
# iOS & Xcode Version Used
    •    iOS Deployment Target: 15.6 or later
    •    Xcode Version: 26.0.1
    
# Brief Explanation of Architecture (MVVM)
    •    Model: Represents core data structures, such as the  Post  entity.
    •    View: SwiftUI view files define what you see onscreen and respond to user interaction.
    •    ViewModel: Contains business logic, fetches/manipulates data, and exposes state and actions to the View. Communicates with the Model and provides properties/methods used by the View.
MVVM increases code modularity by separating UI code from logic and state management for a cleaner, more maintainable codebase.

# Assumptions & Improvements
Assumptions:
    •    The networking/API layer returns valid data and basic error handling is present.
    •    Users can view posts and toggle favorites in the UI.
Potential Improvements (with more time):
    •    Persist favorites and user actions locally (e.g., Core Data).
    •    Expand error handling with user-facing feedback and recovery options.
    •    Improve accessibility and UI polish (animations, better layouts).
    •    Implement pagination and load-more features for post lists.
    •    Implement features like Sign in/Sign up, Make a post and a user profile section.
