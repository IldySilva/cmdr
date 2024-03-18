import 'package:test/test.dart';
import 'package:cmdr/cmdr.dart';

import '../example/usecase/user/user.dart';

// Define command and query classes
class CreateUserCommand {}

class GetUserQuery {}

// Define command and query handlers
class CreateUserCommandHandler {
  Future<void> handle(CreateUserCommand command) async {}
}

class GetUserQueryHandler {
  Future<User> handle(GetUserQuery query) async {
    return User('123', 'test_user', 'test@example.com');
  }
}

void main() {
  group('Mediator Tests', () {
    test('Register and Handle Command', () async {
      // Arrange
      var mediator = Mediator();
      var commandHandler = CreateUserCommandHandler();
      mediator.registerHandler(CreateUserCommand, commandHandler);

      // Act
      var command = CreateUserCommand();
      await mediator.send(command);

      // Assert
      // Add assertions as needed
    });

    test('Register and Handle Query', () async {
      // Arrange
      var mediator = Mediator();
      var queryHandler = GetUserQueryHandler();
      mediator.registerHandler(GetUserQuery, queryHandler);

      // Act
      var query = GetUserQuery();
      var result = await mediator.send(query);

      // Assert
      expect(result.userId, '123');
      expect(result.username, 'test_user');
      expect(result.email, 'test@example.com');
    });
  });
}
