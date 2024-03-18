// Exemplo de comando

// Define a command class
import 'package:cmdr/cmdr.dart';

class CreateUserCommand extends Command {
  final String username;
  final String email;

  CreateUserCommand(this.username, this.email);
}
