import 'dart:async';

import 'package:cmdr/cmdr.dart';

class NumberQuery extends Query<int> {
  final int number;

  NumberQuery(this.number);
}

class NumberQueryHandler extends QueryHandler<NumberQuery, int> {
  @override
  Future<int> handle(NumberQuery query) async {
    return query.number * 2;
  }
}

void main() async {
  // Criação do Mediator e registro do manipulador
  final mediator = Mediator();
  mediator.registerHandler(NumberQuery, NumberQueryHandler());

  // Criando um Stream de números
  Stream<NumberQuery> numberStream = Stream.fromIterable([
    NumberQuery(1),
    NumberQuery(2),
    NumberQuery(3),
    NumberQuery(4),
  ]);

  // Usando o sendStream para processar a consulta de números
  await for (var result in mediator.sendStream(numberStream)) {
    print('Processed result: $result'); // Imprimindo os resultados processados
  }
}
