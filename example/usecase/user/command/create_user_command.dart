// Exemplo de comando
import 'package:cmdr/cmdr.dart';

class CreateUserCommand extends Command<int> {
  final String username;
  CreateUserCommand(this.username);
}
