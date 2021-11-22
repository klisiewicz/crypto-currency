import 'package:mocktail/mocktail.dart';

extension WhenExt<T> on When<T> {
  void thenAnswerValue(T value) => thenAnswer((_) => value);
}

extension WhenStreamExt<T> on When<Stream<T>> {
  void thenAnswerStreamValue(T value) => thenAnswer((_) => Stream.value(value));
}

extension WhenFutureExt<T> on When<Future<T>> {
  void thenAnswerFutureValue(T value) => thenAnswer((_) async => value);

  void thenAnswerDelayedValue(
      T value, {
        required Duration delay,
      }) {
    thenAnswer((_) async => Future.delayed(delay, () => value));
  }

  void thenThrowDelayedError(
      Object error, {
        required Duration delay,
      }) {
    thenAnswer((_) async => Future.delayed(delay, () => throw error));
  }
}
