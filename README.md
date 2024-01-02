# Flutter Todo App with RESTful API and Dark Mode UI

Welcome to the Flutter Todo App project! This repository serves as a practical guide to learning the basics of working with RESTful APIs in Flutter while implementing a Todo application that includes CRUD operations. Additionally, the project demonstrates the integration of a basic dark mode user interface.

## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Features](#features)
- [RESTful API Integration](#restful-api-integration)
- [Dark Mode UI](#dark-mode-ui)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started, make sure you have Flutter installed on your machine. If not, you can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).

Clone this repository to your local machine:

```bash
git clone https://github.com/duyhuy27/Flutter-Todo-App-RESTful.git
cd flutter-todo-app
```

Install dependencies and run the project:

```bash
flutter pub get
flutter run
```

This will launch the Todo App on your connected device or emulator.

## Project Structure

The project is organized to facilitate easy understanding and development. Key folders include:

- **lib**: Contains the Dart code for the Flutter app.
  - **screen**: Individual Dart files for Todo CRUD operations and UI components.
  - **widget**: Reusable widgets used across screens.
  - **service**: Contains service classes and models for communication with the RESTful API.
  - **utils**: Utility functions and classes.
  - **themes**: Dark mode theme configurations.

## Features

This Todo App project includes the following features:

- **CRUD Operations**: Perform Create, Read, Update, and Delete operations on Todo items.
- **RESTful API Integration**: Communicate with a RESTful API at [http://api.nstack.in/#/Todo/TodoController_update](http://api.nstack.in/#/Todo/TodoController_update).
- **Dark Mode UI**: Implement a basic dark mode theme for the application.

## RESTful API Integration

The project utilizes the [nStack API](http://api.nstack.in/#/Todo/TodoController_update) for demonstrating RESTful API integration. The `api` folder contains service classes and models responsible for handling communication with the API. Be sure to update the API configurations in the `api` folder if you wish to use your own API or test server.

## Dark Mode UI

Explore the implementation of dark mode in the `themes` folder. The Todo App includes a toggle switch for users to switch between light and dark modes. Understand how to customize and switch themes dynamically.

## Usage

This project is designed for educational purposes, providing a hands-on experience with Flutter, RESTful APIs, and dark mode UI. Feel free to use the code in your projects, modify it, or expand upon it as needed.

## Contributing

Contributions are welcome! If you encounter bugs, have suggestions, or want to add features, please open an issue or submit a pull request. Follow the [contribution guidelines](CONTRIBUTING.md) for more details.

## License

This project is licensed under the [MIT License](LICENSE), allowing for personal and commercial use.

Happy coding! 🚀