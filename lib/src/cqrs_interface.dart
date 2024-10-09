import 'dart:async';

abstract class Command<T> {}

abstract class Query<T> {}

abstract class CommandHandler<TCommand extends Command, TResult> {
  FutureOr<TResult> handle(TCommand command);
}

abstract class QueryHandler<TQuery extends Query, TResult> {
  FutureOr<TResult> handle(TQuery query);
}
