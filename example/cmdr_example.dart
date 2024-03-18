import 'package:cmdr/cmdr.dart';

import 'usecase/user/command/create_user_command.dart';
import 'usecase/user/command/create_user_command_handler.dart';
import 'usecase/user/query/get_user_query.dart';
import 'usecase/user/query/get_user_query_handler.dart';

void main() async {
  // Create an instance of mediator
  var mediator = Mediator();

  // Register command and query handlers
  var commandHandler = CreateUserCommandHandler();
  var queryHandler = GetUserQueryHandler();

  mediator.registerHandler(CreateUserCommand, commandHandler);
  mediator.registerHandler(GetUserQuery, queryHandler);

  // Example case for command
  var createUserCommand = CreateUserCommand('john_doe', 'john@example.com');
  print('Sending create user command...');
  await mediator.send(createUserCommand);

  // Example case for query
  var getUserQuery = GetUserQuery('123456');
  print('\nSending get user query...');
  var user = await mediator.send(getUserQuery);
  print('User details:');
  print('User ID: ${user.userId}');
  print('Username: ${user.username}');
  print('Email: ${user.email}');
}
