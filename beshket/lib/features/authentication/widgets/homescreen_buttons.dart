import 'package:flutter/cupertino.dart';

class SegmentedFilterButton extends StatefulWidget {
  const SegmentedFilterButton({super.key});

  @override
  State<SegmentedFilterButton> createState() => _SegmentedFilterButtonState();
}

class _SegmentedFilterButtonState extends State<SegmentedFilterButton> {
  int? _sliding = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: const {
        0: Text('All events'),
        1: Text('By location'),
      },
      groupValue: _sliding,
      onValueChanged: (int? newValue) {
        setState(() {
          _sliding = newValue;
          print(_sliding);
        });
      },
    );
  }
}
