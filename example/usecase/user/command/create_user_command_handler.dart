import 'package:cmdr/cmdr.dart';

import 'create_user_command.dart';

class CreateUserCommandHandler extends CommandHandler<CreateUserCommand, int> {
  @override
  Future<int> handle(CreateUserCommand command) async {
    print("A Criar Utilizador");
    return 50; // Id de usuário;
  }
}
