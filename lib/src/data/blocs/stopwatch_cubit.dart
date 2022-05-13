import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:stopwatch/src/data/models/stopwatch_state_model.dart';
import 'package:stopwatch/src/globals/enums.dart';

const Duration _timerDuration = Duration(milliseconds: 1);

class StopwatchCubit extends Cubit<StopWatchStateModel> {
  StopwatchCubit() : super(StopWatchStateModel.init());

  late Timer _timer;
  int _milliseconds = 0;

  onAction(StopWatchActions action) {
    switch (action) {
      case StopWatchActions.stop:
        if (state.stopWatchState == StopWatchState.stopped) {
          debugPrint('error conflict');
        }
        _timer.cancel();
        _milliseconds = 0;
        emit(state.copyWith(updateStopWatchState: StopWatchState.stopped, updateMilliseconds: _milliseconds));

        return;
      case StopWatchActions.start:
      case StopWatchActions.resume:
        if (state.stopWatchState == StopWatchState.running) {
          debugPrint('error conflict');
        }

        _timer = Timer.periodic(_timerDuration, (Timer _t) {
          _milliseconds++;
          emit(state.copyWith(updateStopWatchState: StopWatchState.running, updateMilliseconds: _milliseconds));
        });

        return;

      case StopWatchActions.pause:
        if (state.stopWatchState == StopWatchState.paused) {
          debugPrint('error conflict');
        }
        _timer.cancel();
        emit(state.copyWith(updateStopWatchState: StopWatchState.paused, updateMilliseconds: _milliseconds));
        return;
    }
  }
}
