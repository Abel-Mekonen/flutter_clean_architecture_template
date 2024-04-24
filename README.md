 Flutter Clean Architecture Template

This is a Flutter template project that follows the principles of Clean Architecture. It aims to provide a structured and scalable architecture for Flutter applications, inspired by the Clean Architecture principles and the [Reso Coder's Flutter TDD Clean Architecture Course](https://resocoder.com/flutter-clean-architecture-tdd/).

## Project Structure

The project structure follows a modular approach, separating concerns into different layers:

flutter_ca_template/
```
└── 📁lib
    └── 📁app
        └── 📁core
            └── 📁auth
                └── 📁bloc
                    └── auth_bloc.dart
                    └── auth_bloc.freezed.dart
                    └── auth_event.dart
                    └── auth_state.dart
                └── 📁cubit
                    └── auth_cubit.dart
                    └── auth_cubit.freezed.dart
                    └── auth_state.dart
        └── 📁navigation
            └── navigator.dart
            └── routes.dart
        └── 📁pages
            └── 📁auth
                └── 📁bloc
                    └── 📁login
                        └── login_bloc.dart
                        └── login_bloc.freezed.dart
                        └── login_event.dart
                        └── login_state.dart
                    └── 📁logout
                        └── logout_bloc.dart
                        └── logout_bloc.freezed.dart
                        └── logout_event.dart
                        └── logout_state.dart
                    └── 📁signup
                        └── signup_bloc.dart
                        └── signup_bloc.freezed.dart
                        └── signup_event.dart
                        └── signup_state.dart
                └── login.dart
                └── signup.dart
            └── 📁home
                └── home.dart
    └── 📁constants
        └── string_constants.dart
    └── 📁data
        └── 📁local
            └── 📁db
                └── app_database.dart
                └── app_database.g.dart
                └── 📁dao
                    └── test_dao.dart
                └── 📁model
                    └── test.dart
            └── 📁pref
                └── pref.dart
        └── 📁remote
            └── 📁client
                └── auth_client.dart
                └── auth_client.g.dart
                └── user_client.dart
                └── user_client.g.dart
            └── 📁config
                └── network_config.dart
            └── 📁model
                └── jsend_response.dart
                └── jsend_response.g.dart
                └── login_dto.dart
                └── login_dto.g.dart
                └── login_response_dto.dart
                └── login_response_dto.g.dart
        └── 📁repository
            └── auth_repository.dart
    └── 📁di
        └── app_module.dart
    └── 📁domain
        └── 📁config
            └── network_config.dart
        └── 📁entity
            └── login.dart
            └── login_response.dart
        └── 📁repository
            └── auth_repository.dart
    └── injection.config.dart
    └── injection.dart
    └── main.dart
    └── 📁util
        └── app_exception.dart
        └── failure.dart
        └── jwt_interceptor.dart
        └── log_interceptor.dart
        └── resource.dart
```



## Dependencies

- **flutter_bloc**: For state management using the BLoC pattern.
- **freezed_annotation**: For generating immutable classes with freezed.
- **json_serializable**: For generating JSON serialization code.
- **retrofit**: For type-safe HTTP client generation.
- **dio**: For making HTTP requests.
- **get_it**: For service locator and dependency injection.
- **injectable**: For easy and intuitive dependency injection.
- **shared_preferences**: For storing simple data in local storage.
- **go_router**: For routing.
- **floor**: For SQLite database operations with Flutter.

## Development Dependencies

- **flutter_test**: For writing unit and widget tests.
- **freezed**: For freezing classes to make them immutable.
- **retrofit_generator**: For generating code for Retrofit HTTP clients.
- **injectable_generator**: For generating code for dependency injection.
- **floor_generator**: For generating code for Floor SQLite database operations.

## Getting Started

1. Clone this repository.
2. Run `flutter pub get` to install dependencies.
3. Start building your application!

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Reso Coder's Flutter TDD Clean Architecture Course: This project is inspired by the concepts and architecture taught in this course.
- Flutter community: Many ideas and best practices in this project are adopted from the Flutter community's contributions and discussions.

