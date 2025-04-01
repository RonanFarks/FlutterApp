# Post Display App

A Flutter application designed to fetch and display post data from a remote API. This project showcases best practices in data fetching, state management, and UI design within the Flutter framework.

## Features

* **Data Fetching:** Utilizes the `http` package to retrieve JSON data from a specified API endpoint.
* **Asynchronous Data Handling:** Employs `FutureBuilder` and `async/await` for efficient and non-blocking data retrieval.
* **State Management:** Implements `setState` for managing the application's state, including loading, error, and data display.
* **Dynamic List Display:** Displays fetched post data in a `ListView.builder` for efficient rendering of large datasets.
* **Detailed Post View:** Includes a `PostDetail` screen to display comprehensive information about a selected post.
* **User Interaction:** Incorporates drag-to-side actions (`SlidableAction`) for quick access to post details.
* **Settings Drawer:** Offers a settings drawer with a dark mode toggle switch.
* **Improved UI:** Uses `Card` widgets and styled text to create a more user-friendly interface.
* **Clear Error Handling:** Displays user-friendly error messages when data fetching fails.

## Getting Started

### Prerequisites

* Flutter SDK installed on your machine.
* Basic understanding of Flutter and Dart.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone [repository_url]
    cd post_display
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the application:**

    ```bash
    flutter run
    ```

## Project Structure

## Dependencies

* `http`: For making HTTP requests.
* `flutter_slidable`: For implementing drag-to-side actions.

## Usage

The application fetches post data from a remote API and displays it in a list. Users can:

* Tap on a list item to view detailed post information.
* Drag list items to the side to access view and delete options.
* Toggle dark mode in the settings drawer.

## Future Enhancements

* Implement a more robust state management solution (e.g., Provider, Bloc, Riverpod).
* Add unit and widget tests.
* Implement pagination for large datasets.
* Add a loading indicator while data is being fetched.
* Improve error handling and user feedback.
* Implement local data caching.
* Add filtering and sorting options.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to suggest improvements or report bugs.

## Author

[Ronan Farquharson]