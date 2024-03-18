import 'package:cmdr/cmdr.dart';

import 'usecase/user/command/create_user_command.dart';

main() {
  Mediator mediator = Mediator();
  mediator.send(CreateUserCommand("Olá Mundo"));
}
