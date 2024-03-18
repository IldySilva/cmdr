// Definição da classe base para comandos
import 'dart:async';

abstract class Command<T> {}

// Definição da classe base para consultas
abstract class Query<T> {}

// Definição da classe base para manipuladores de comandos
abstract class CommandHandler<TCommand extends Command, TResult> {
  FutureOr<TResult> handle(TCommand command);
}

// Definição da classe base para manipuladores de consultas
abstract class QueryHandler<TQuery extends Query, TResult> {
  FutureOr<TResult> handle(TQuery query);
}
