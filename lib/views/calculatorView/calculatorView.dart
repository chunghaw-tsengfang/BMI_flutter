import 'package:example_project/views/calculatorView/widgets/genderButton.dart';
import 'package:example_project/views/calculatorView/widgets/heightSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/userHealthInfo.dart';
import '../../viewModels/bmi_viewmodel.dart';
import 'widgets/selectorButton.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userHealth = ref.watch(userHealthProvider);
    ref.listen<UserHealthInfo>(userHealthProvider,
        (UserHealthInfo? prev, UserHealthInfo newUserInfo) {
      if (newUserInfo.bmiValue > 25.0) {
        const snackBar = SnackBar(
          content: Text('You are fat!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate BMI"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeightSlider(
              height: userHealth.height,
              heightSelectCallback: (double value) {
                ref.read(userHealthProvider.notifier).updateHeight(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectorButton(
                  title: "Weight",
                  value: userHealth.weight,
                  onSelectChanged: (int value) {
                    ref.read(userHealthProvider.notifier).updateWeight(value);
                  },
                ),
                SelectorButton(
                  title: "Age",
                  value: userHealth.age,
                  onSelectChanged: (int value) {
                    ref.read(userHealthProvider.notifier).updateAge(value);
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ref.watch(userHealthProvider.notifier).calculateBMI();
                Navigator.pushNamed(context, '/result');
              },
              child: Text("Calculate the BMI"),
            )
          ],
        ));
  }
}

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => HomeViewState();
// }
//
// class HomeViewState extends State<HomeView> {
//   final List<bool> _gender = [true, false];
//   double _height = 120.0;
//   int _weight = 40;
//   int _age = 20;
//
//   void _updateGender(int index) {
//     setState(() {
//       for (int i = 0; i < _gender.length; i++) {
//         _gender[i] = i == index;
//       }
//     });
//   }
//
//   void _updateHeight(double height) {
//     setState(() {
//       _height = height;
//     });
//   }
//
//   void _increaseValue(String type) {
//     setState(() {
//       switch (type) {
//         case "Weight":
//           _weight = _weight + 1;
//           break;
//         case "Age":
//           _age = _age + 1;
//           break;
//       }
//     });
//   }
//
//   void _decreaseValue(String type) {
//     setState(() {
//       switch (type) {
//         case "Weight":
//           _weight = _weight - 1;
//           break;
//         case "Age":
//           _age = _age - 1;
//           break;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Calculate BMI"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GenderButton(gender: _gender, genderSelectCallback: _updateGender),
//             HeightSlider(height: _height, heightSelectCallback: _updateHeight),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SelectorButton(
//                   title: "Weight",
//                   value: _weight,
//                   onMinusPressed: _decreaseValue,
//                   onPlusPressed: _increaseValue,
//                 ),
//                 SelectorButton(
//                   title: "Age",
//                   value: _age,
//                   onMinusPressed: _decreaseValue,
//                   onPlusPressed: _increaseValue,
//                 )
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () => {Navigator.pushNamed(context, '/result')},
//               child: Text("Calculate the BMI"),
//             )
//           ],
//         ));
//   }
// }
