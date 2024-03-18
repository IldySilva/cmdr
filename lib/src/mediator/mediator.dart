import 'dart:async';

class Mediator {
  final Map<Type, dynamic> _handlers = {};
  static final Mediator _instance = Mediator._internal();
  factory Mediator() => _instance;
  Mediator._internal();

  void registerHandler(Type type, dynamic handler) {
    _handlers[type] = handler;
  }

  Future<dynamic> send(dynamic request) async {
    var handler = _handlers[request.runtimeType];
    if (handler == null) {
      throw Exception('No handler registered for ${request.runtimeType}.');
    }
    try {
      var result = await handler.handle(request);
      return result;
    } catch (e) {
      throw Exception('Error handling request: $e');
    }
  }

  Stream<dynamic> sendStream(Stream<dynamic> requestStream) async* {
    await for (var request in requestStream) {
      try {
        var handler = _handlers[request.runtimeType];
        if (handler == null) {
          throw Exception('No handler registered for ${request.runtimeType}.');
        }
        var result = await handler.handle(request);
        yield result;
      } catch (e) {
        print('Error handling request: $e');
      }
    }
  }
}
