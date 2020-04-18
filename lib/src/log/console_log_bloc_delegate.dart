import 'package:bloc/bloc.dart';

class LogBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    // ignore: avoid_print
    print('BLOC[${bloc.runtimeType}]: Event ${event.runtimeType} dispatched');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // ignore: avoid_print
    print(
      'BLOC[${bloc.runtimeType}]: '
      'Transition from ${transition.currentState.runtimeType} '
      'to ${transition.nextState.runtimeType} '
      'caused by ${transition.event.runtimeType}',
    );
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    // ignore: avoid_print
    print('BLOC[${bloc.runtimeType}]: ERROR, $error, $stacktrace');
  }
}
