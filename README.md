
# cdmr(Commander )

cmdr is a Dart package that provides a lightweight implementation of the Mediator pattern tailored for Command Query Responsibility Segregation (CQRS) applications.


Installation
Add cmdr to your pubspec.yaml file:


## Installation

To use `cmdr` in your Dart project, add it to your `pubspec.yaml` file:

```bash
dependencies:
  cmdr: ^1.0.0

```
then run:
    
 ```bash
    dart pub get
```

## Usage/Examples

### Importing the package
```dart
import 'package:cmdr/cmdr.dart';
```

### Creating a Mediator
```dart
var mediator = Mediator();
```

### Registering Handlers
```dart
class MyCommandHandler {
  Future<void> handle(MyCommand command) async {
    // Command handling logic
  }
}

class MyQueryHandler {
  Future<Result> handle(MyQuery query) async {
    // Query handling logic
  }
}

var commandHandler = MyCommandHandler();
var queryHandler = MyQueryHandler();

mediator.registerHandler(MyCommand, commandHandler);
mediator.registerHandler(MyQuery, queryHandler);

```

### Sendind Requests
```dart
var command = MyCommand();
var query = MyQuery();

await mediator.send(command);
var result = await mediator.send(query);
```
## API Reference

#### Mediator
Registers a handler for a specific type of command or query.
```dart
 void registerHandler(Type type, dynamic handler)
```

**type:** The type of command or query.

**handler:** The handler responsible for handling commands or queries of the specified type.

#### send
Sends a command or query to the registered handler.

```dart
Future<dynamic> send(dynamic request)
```

**request:** The command or query to be sent to the handler.
## Examples
For more detailed examples, please refer to the [example]() directory.
## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request in the GitHub repository.

## License

[MIT](https://choosealicense.com/licenses/mit/)

