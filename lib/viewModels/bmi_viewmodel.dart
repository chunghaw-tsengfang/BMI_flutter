import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../models/userHealthInfo.dart';

final userHealthProvider =
    StateNotifierProvider<UserHealthNotifier, UserHealthInfo>((ref) {
  return UserHealthNotifier(ref);
});

// Repository Adding + Fetching from the Database
class UserHealthNotifier extends StateNotifier<UserHealthInfo> {
  UserHealthNotifier(
      StateNotifierProviderRef<UserHealthNotifier, UserHealthInfo> ref)
      : super(const UserHealthInfo());

  // Data that will be saved into Firestore
  // final List<UserHealthInfo> _userHealthList = [
  //   UserHealthInfo(name: "Tester", calculatedAt: DateTime.now(), bmiValue: 20)
  // ];

  // Future<List<UserHealthInfo>> fetchBMIList() async {
  //   return _userHealthList;
  // }

  void updateGender(Gender gender) {
    state = state.copy(
        name: state.name,
        gender: gender,
        height: state.height,
        weight: state.weight,
        age: state.age,
        bmiValue: state.bmiValue);
  }

  void updateWeight(int weight) {
    state = state.copy(
        name: state.name,
        gender: state.gender,
        height: state.height,
        weight: weight,
        age: state.age,
        bmiValue: state.bmiValue);
  }

  void updateHeight(double height) {
    state = state.copy(
        name: state.name,
        gender: state.gender,
        height: height,
        weight: state.weight,
        age: state.age,
        bmiValue: state.bmiValue);
  }

  void updateAge(int age) {
    state = state.copy(
        name: state.name,
        gender: state.gender,
        height: state.height,
        weight: state.weight,
        age: age,
        bmiValue: state.bmiValue);
  }

  void calculateBMI() {
    double bmi = state.weight / pow(state.height / 100, 2);
    state = state.copy(
        name: state.name,
        gender: state.gender,
        height: state.height,
        weight: state.weight,
        age: state.age,
        bmiValue: bmi);
  }
}
