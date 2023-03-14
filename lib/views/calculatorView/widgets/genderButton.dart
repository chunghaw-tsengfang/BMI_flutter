import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton(
      {Key? key, required this.gender, required this.genderSelectCallback})
      : super(key: key);
  final List<bool> gender;
  final ValueChanged<int> genderSelectCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff3A1078),
      padding: const EdgeInsets.all(10),
      child: ToggleButtons(
        onPressed: genderSelectCallback,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.red[700],
        selectedColor: Colors.white,
        fillColor: Colors.red[200],
        color: Colors.red[400],
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
        isSelected: gender,
        children: const [
          Text('Male'),
          Text('Female'),
        ],
      ),
    );
  }
}
