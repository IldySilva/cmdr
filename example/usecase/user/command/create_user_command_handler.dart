import 'package:cmdr/cmdr.dart';

import 'create_user_command.dart';

// Define command handler
class CreateUserCommandHandler extends CommandHandler<CreateUserCommand, void> {
  Future<void> handle(CreateUserCommand command) async {
    // Command handling logic to create user
    print('Creating user: ${command.username}, ${command.email}');
    // Simulated asynchronous operation
    await Future.delayed(Duration(seconds: 1));
    print('User created successfully');
  }
}
