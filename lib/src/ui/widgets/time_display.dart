import 'package:flutter/material.dart';

String getMilliDisplay(int m) {
  if (m < 10) return '00$m';
  if (m < 100) return '0$m';
  return '$m';
}

String getSecMinDisplay(int sm) {
  if (sm < 10) return '0$sm';
  return '$sm';
}

class TimeDisplay extends StatelessWidget {
  final int milliseconds;

  const TimeDisplay(this.milliseconds, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late int hours;
    late int minutes;
    late int secs;
    late int milli;

    if (milliseconds > 999) {
      secs = milliseconds ~/ 1000;
      milli = milliseconds % 1000;
    } else {
      hours = 0;
      minutes = 0;
      secs = 0;
      milli = milliseconds;
    }

    if (secs > 59) {
      minutes = secs ~/ 60;
      secs = secs % 60;
    } else {
      hours = 0;
      minutes = 0;
    }

    if (minutes > 59) {
      hours = minutes ~/ 60;
      minutes = minutes % 60;
    } else {
      hours = 0;
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('$hours'),
              const Text('HOURS'),
            ],
          ),
          const Text(' : '),
          Column(
            children: [
              Text(getSecMinDisplay(minutes)),
              const Text('MINS'),
            ],
          ),
          const Text(' : '),
          Column(
            children: [
              Text(getSecMinDisplay(secs)),
              const Text('SECS'),
            ],
          ),
          const Text(' . '),
          Column(
            children: [
              Text(getMilliDisplay(milli)),
              const Text('MILLI'),
            ],
          )
        ],
      ),
    );
  }
}
