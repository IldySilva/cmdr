import 'package:cmdr/cmdr.dart';
import 'package:cmdr/src/piplines_types.dart';

class Mediator {
  final Map<Type, dynamic> _handlers = {};
  final Map<Type, List<PreProcessor<dynamic>>> _preProcessors = {};
  final Map<Type, List<PostProcessor<dynamic, dynamic>>> _postProcessors = {};

  static final Mediator _instance = Mediator._internal();
  factory Mediator() => _instance;
  Mediator._internal();

  void registerHandler(Type type, dynamic handler) {
    _handlers[type] = handler;
  }

  void registerPreProcessor(Type type, PreProcessor<dynamic> preProcessor) {
    _preProcessors.putIfAbsent(type, () => []).add(preProcessor);
  }

  void registerPostProcessor(
      Type type, PostProcessor<dynamic, dynamic> postProcessor) {
    _postProcessors.putIfAbsent(type, () => []).add(postProcessor);
  }

  Future<T> send<T>(dynamic request) async {
    var handler = _handlers[request.runtimeType];
    if (handler == null) {
      throw Exception('No handler registered for ${request.runtimeType}.');
    }

    // Execute pre-processors
    await _executePreProcessors(request);

    var result;
    try {
      result = await handler.handle(request);
    } catch (e) {
      throw Exception('Error handling request: $e');
    }

    // Execute post-processors
    await _executePostProcessors(request, result);

    return result as T;
  }

  Future<void> _executePreProcessors(dynamic request) async {
    var processors = _preProcessors[request.runtimeType];
    if (processors != null) {
      for (var processor in processors) {
        await processor.process(request);
      }
    }
  }

  Future<void> _executePostProcessors(dynamic request, dynamic result) async {
    var processors = _postProcessors[request.runtimeType];
    if (processors != null) {
      for (var processor in processors) {
        await processor.process(request, result);
      }
    }
  }

  Stream<TResult> sendStreamQuery<TResult>(
      Stream<Query<TResult>> requestStream) async* {
    await for (var query in requestStream) {
      var handler = _handlers[query.runtimeType];
      if (handler == null) {
        throw Exception('No handler registered for ${query.runtimeType}.');
      }
      yield await handler
          .handle(query); // Await the result of the query handler
    }
  }
}
