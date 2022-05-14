import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/src/data/blocs/stopwatch_cubit.dart';
import 'package:stopwatch/src/data/models/stopwatch_state_model.dart';
import 'package:stopwatch/src/globals/enums.dart';
import 'package:stopwatch/src/ui/widgets/button_bars.dart';
import 'package:stopwatch/src/ui/widgets/time_display.dart';

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StopwatchCubit stopwatchCubit = StopwatchCubit();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(':::: STOPWATCH ::::'),
      ),
      body: BlocBuilder<StopwatchCubit, StopWatchStateModel>(
        bloc: stopwatchCubit,
        builder: (BuildContext context, StopWatchStateModel modelState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeDisplay(modelState.milliseconds),
              GetButtonBar(
                state: modelState.stopWatchState,
                runAction: (StopWatchActions action) => stopwatchCubit.onAction(action),
              )
            ],
          );
        },
      ),
    );
  }
}
