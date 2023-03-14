import 'package:flutter/material.dart';

class SelectorButton extends StatelessWidget {
  const SelectorButton(
      {Key? key,
      required this.title,
      required this.value,
      required this.onSelectChanged,
      required})
      : super(key: key);
  final String title;
  final int value;
  final ValueChanged<int> onSelectChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff3A1078),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title),
          Text("$value"),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => onSelectChanged(value + 1),
                  child: const Text("+")),
              ElevatedButton(
                  onPressed: () => onSelectChanged(value - 1),
                  child: const Text('-'))
            ],
          )
        ]));
  }
}
