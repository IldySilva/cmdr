import '../cqrs/cqrs_interface.dart';

abstract class Middleware {
  Future<void> handleCommand<TCommand extends Command>(
      TCommand command, NextHandler next);
  Future<TResult> handleQuery<TQuery extends Query, TResult>(
      TQuery query, NextHandlerWithResult next);
}

typedef NextHandler = Future<void> Function();
typedef NextHandlerWithResult<TResult> = Future<TResult> Function();

class CommandQueryProcessor {
  final Middleware _middleware;

  CommandQueryProcessor(this._middleware);

  Future<void> executeCommand<TCommand extends Command>(
      TCommand command) async {
    await _middleware.handleCommand<TCommand>(command, () async {
      // Executa o comando
    });
  }

  Future<TResult> executeQuery<TQuery extends Query, TResult>(
      TQuery query) async {
    return await _middleware.handleQuery<TQuery, TResult>(query, () async {
      // Executa a consulta e retorna o resultado
      return null; // Substitua null pelo resultado real da consulta
    });
  }
}
