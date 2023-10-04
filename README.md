# BlogEx Flutter App

BlogEx is a Flutter application that allows users to explore a curated list of blogs, view their details, and mark their favorite blogs. This README provides an overview of the app's features and functionality.
## Here are some screenshots
<img src="https://imgur.com/Ip4gI1x" alt="Screenshot 1" width="300">
<img src="https://imgur.com/yGAzlQe" alt="Screenshot 2" width="300">


## Features

### API Integration

- BlogEx integrates with a remote API to fetch data about various blogs.

### Blog List View

- The app displays a list of blogs on the main screen.
- Each blog item in the list shows the blog's title and a preview image.
- Users can tap on any blog item to view its details.

### Detailed Blog View

- BlogEx includes a dedicated screen for displaying the full details of a selected blog.
- The detailed view includes the blog's title and a larger image.

### Navigation

- The app provides smooth navigation between the blog list view, the detailed blog view , saved blogs and their profile.

### Interactive Features

- Users can mark their favorite blogs by tapping on a dedicated button.
- The app remembers the user's favorites even after closing it.

### State Management

- BlogEx utilizes Flutter's state management solutions for efficient state management.
- Provider state management is used.

### Error Handling

- The app gracefully handles cases where the API is unavailable or returns an error.
- Users are presented with friendly error messages in such situations.

### UI/UX Design

- BlogEx features an intuitive and user-friendly UI/UX design.
- The design focuses on providing an engaging and visually appealing experience to users.

## Bonus Feature (Optional)

### Offline Mode

- SQLite is used to implement offline support.
- Users can access and interact with blogs even without an internet connection.
- Favorite blogs are available in offline mode as well.

## Getting Started

To run the BlogEx app on your local machine, follow these steps:

1. Clone this repository to your computer:

   ```bash
   git clone https://github.com/your-username/BlogEx-Flutter.git
