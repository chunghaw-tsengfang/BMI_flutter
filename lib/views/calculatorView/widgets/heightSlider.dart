import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider(
      {Key? key, required this.height, required this.heightSelectCallback})
      : super(key: key);
  final double height;
  final ValueChanged<double> heightSelectCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xff3A1078),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("HEIGHT"),
            Text('$height cm'),
            Slider(
                value: height,
                min: 100,
                max: 210,
                divisions: 110,
                onChanged: heightSelectCallback)
          ],
        ));
  }
}
