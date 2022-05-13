import 'package:flutter/material.dart';
import 'package:stopwatch/src/globals/enums.dart';

class GetButtonBar extends StatelessWidget {
  final StopWatchState state;
  final Function runAction;
  const GetButtonBar({required this.state, required this.runAction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StopWatchState.stopped:
        return StoppedButtons(runAction);
      case StopWatchState.running:
        return RunningButtons(runAction);
      case StopWatchState.paused:
        return PausedButtons(runAction);
    }
    return Container();
  }
}

class StoppedButtons extends StatelessWidget {
  final Function runAction;
  const StoppedButtons(this.runAction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () => runAction(StopWatchActions.start),
            child: Column(
              children: const [Icon(Icons.start), Text('START')],
            )),
      ],
    );
  }
}

class PausedButtons extends StatelessWidget {
  final Function runAction;
  const PausedButtons(this.runAction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () => runAction(StopWatchActions.resume),
            child: Column(
              children: const [Icon(Icons.start), Text('RESUME')],
            )),
        ElevatedButton(
            onPressed: () => runAction(StopWatchActions.stop),
            child: Column(
              children: const [Icon(Icons.stop), Text('STOP')],
            )),
      ],
    );
  }
}

class RunningButtons extends StatelessWidget {
  final Function runAction;
  const RunningButtons(this.runAction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () => runAction(StopWatchActions.pause),
            child: Column(
              children: const [Icon(Icons.pause), Text('PAUSE')],
            )),
        ElevatedButton(
            onPressed: () => runAction(StopWatchActions.stop),
            child: Column(
              children: const [Icon(Icons.stop), Text('STOP')],
            )),
      ],
    );
  }
}
