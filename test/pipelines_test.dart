// Define a command
import 'dart:async';
import 'package:test/test.dart';

import 'package:cmdr/cmdr.dart';
import 'package:cmdr/src/piplines_types.dart';

class MyCommand extends Command<String> {
  final String data;

  MyCommand(this.data);
}

// Implement a command handler
class MyCommandHandler extends CommandHandler<MyCommand, String> {
  @override
  FutureOr<String> handle(MyCommand command) {
    // Simulate some processing
    return 'Handled command with data: ${command.data}';
  }
}

// Implement a pre-processor
class LoggingPreProcessor<T> implements PreProcessor<T> {
  @override
  FutureOr<void> process(T request) {
    print('Pre-processing request: $request');
  }
}

// Implement a post-processor
class LoggingPostProcessor<T, TResult> implements PostProcessor<T, TResult> {
  @override
  FutureOr<void> process(T request, TResult result) {
    print('Post-processed request: $request with result: $result');
  }
}

void main() {
  test('Mediator should handle commands with pre- and post-processors',
      () async {
    final mediator = Mediator();

    // Register the command handler
    mediator.registerHandler(MyCommand, MyCommandHandler());

    // Register pre- and post-processors
    mediator.registerPreProcessor(MyCommand, LoggingPreProcessor<MyCommand>());
    mediator.registerPostProcessor(
        MyCommand, LoggingPostProcessor<MyCommand, String>());

    // Create a command
    var command = MyCommand("Test Data");

    var result = await mediator.send(command);

    expect(result, 'Handled command with data: Test Data');
  });
}
