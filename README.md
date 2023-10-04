# BlogEx Flutter App

BlogEx is a Flutter application that allows users to explore a curated list of blogs, view their details, and mark their favorite blogs. This README provides an overview of the app's features and functionality.
## Here are some screenshots
<img src="[assets/98037912/87e981dc-9798-4e1a-b47f-5dfe0529f677.png](https://drive.google.com/file/d/1NUpShhsAWSpLnuxR2awhhPD7MflOy42b/view?usp=sharing)" alt="Screenshot" width="300">
<img src="assets/98037912/f54bd289-83dc-446c-ad5d-2cadf286402f.png" alt="Screenshot" width="300">
<img src="assets/98037912/45244a1c-e4fc-4e16-ac14-d6c975ee74ee.png" alt="Screenshot" width="300">
<img src="assets/98037912/4b74f508-5afd-49b2-9d92-84fc593a95f0.png" alt="Screenshot" width="300">
<img src="assets/98037912/6d22d33d-78c9-4109-833b-3ea8578dfca2.png" alt="Screenshot" width="300">
<img src="assets/98037912/676a6257-1909-4a47-9755-e4c89d146624.png" alt="Screenshot" width="300">
<img src="assets/98037912/2dc240f7-627c-43fa-8573-aa762ee45d86.png" alt="Screenshot" width="300">
<img src="assets/98037912/d1ab2e31-532d-4105-a8e6-9b08eab321ec.png" alt="Screenshot" width="300">
<img src="assets/98037912/3856fd0b-5e24-46e3-9860-88664767f0a1.png" alt="Screenshot" width="300">


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
