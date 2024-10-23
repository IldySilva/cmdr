// Example Command and Command Handler
import 'package:cmdr/cmdr.dart';

class AddCommand extends Command<int> {
  final int a;
  final int b;

  AddCommand(this.a, this.b);
}

class AddCommandHandler extends CommandHandler<AddCommand, int> {
  @override
  Future<int> handle(AddCommand command) async {
    return command.a + command.b;
  }
}

// Example Query and Query Handler
class GetTimeQuery extends Query<DateTime> {}

class GetTimeQueryHandler extends QueryHandler<GetTimeQuery, DateTime> {
  @override
  Future<DateTime> handle(GetTimeQuery query) async {
    return DateTime.now();
  }
}

// Example Stream Query Handler
class NumberStreamQuery extends Query<int> {
  final int number;

  NumberStreamQuery(this.number);
}

class NumberStreamQueryHandler
    extends StreamQueryHandler<NumberStreamQuery, int> {
  @override
  Stream<int> handle(NumberStreamQuery query) async* {
    yield query.number * 2; // Doubling the number
  }
}

// Main function
void main() async {
  final mediator = Mediator();

  // Register handlers
  mediator.registerHandler(AddCommand, AddCommandHandler());
  mediator.registerHandler(GetTimeQuery, GetTimeQueryHandler());
  mediator.registerHandler(NumberStreamQuery, NumberStreamQueryHandler());

  // Using the Mediator for a command
  final result = await mediator.send(AddCommand(5, 3));
  print('Add Command Result: $result'); // Output: Add Command Result: 8

  // Using the Mediator for a query
  final timeResult = await mediator.send<int>(GetTimeQuery());
  print('Current Time: $timeResult');

  // Using the Mediator for a stream query
  final numberStream = Stream.fromIterable([
    NumberStreamQuery(1),
    NumberStreamQuery(2),
    NumberStreamQuery(3),
  ]);
  mediator.sendStreamQuery(numberStream).listen((V) => print(V));
}
