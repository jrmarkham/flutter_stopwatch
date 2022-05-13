import 'package:stopwatch/src/globals/enums.dart';

class StopWatchStateModel {
  final StopWatchState stopWatchState;
  final int milliseconds;

  const StopWatchStateModel({required this.stopWatchState, required this.milliseconds});

  static StopWatchStateModel init() => const StopWatchStateModel(stopWatchState: StopWatchState.stopped, milliseconds: 0);

  StopWatchStateModel copyWith({StopWatchState? updateStopWatchState, int? updateMilliseconds}) =>
      StopWatchStateModel(stopWatchState: updateStopWatchState ?? stopWatchState, milliseconds: updateMilliseconds ?? milliseconds);
}
