import 'dart:async';

abstract class PreProcessor<T> {
  FutureOr<void> process(T request);
}

abstract class PostProcessor<T, TResult> {
  FutureOr<void> process(T request, TResult result);
}
