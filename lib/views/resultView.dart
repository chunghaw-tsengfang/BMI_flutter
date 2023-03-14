import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewModels/bmi_viewmodel.dart';

class ResultsView extends ConsumerWidget {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userHealth = ref.watch(userHealthProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate BMI"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI Value is"),
            Text('${userHealth.bmiValue}'),
            ElevatedButton(
              child: Text("Back"),
              onPressed: () => {Navigator.pop(context, true)},
            )
          ],
        )));
  }
}
