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
    late int _hours;
    late int _minutes;
    late int _secs;
    late int _milli;

    if (milliseconds > 999) {
      _secs = milliseconds ~/ 1000;
      _milli = milliseconds % 1000;
    } else {
      _hours = 0;
      _minutes = 0;
      _secs = 0;
      _milli = milliseconds;
    }

    if (_secs > 59) {
      _minutes = _secs ~/ 60;
      _secs = _secs % 60;
    } else {
      _hours = 0;
      _minutes = 0;
    }

    if (_minutes > 59) {
      _hours = _minutes ~/ 60;
      _minutes = _minutes % 60;
    } else {
      _hours = 0;
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('$_hours'),
              const Text('HOURS'),
            ],
          ),
          const Text(' : '),
          Column(
            children: [
              Text(getSecMinDisplay(_minutes)),
              const Text('MINS'),
            ],
          ),
          const Text(' : '),
          Column(
            children: [
              Text(getSecMinDisplay(_secs)),
              const Text('SECS'),
            ],
          ),
          const Text(' . '),
          Column(
            children: [
              Text(getMilliDisplay(_milli)),
              const Text('MILLI'),
            ],
          )
        ],
      ),
    );
  }
}
