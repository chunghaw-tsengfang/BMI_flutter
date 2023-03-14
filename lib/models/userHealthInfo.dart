enum Gender { Male, Female }

class UserHealthInfo {
  final String name;
  final Gender gender;
  final double height;
  final int weight;
  final int age;
  final double bmiValue;

  const UserHealthInfo(
      {this.name = "",
      this.bmiValue = 0,
      this.gender = Gender.Male,
      this.weight = 50,
      this.age = 20,
      this.height = 150});

  UserHealthInfo copy(
          {required String name,
          required Gender gender,
          required double height,
          required int weight,
          required int age,
          required double bmiValue}) =>
      UserHealthInfo(
        name: name,
        gender: gender,
        height: height,
        weight: weight,
        age: age,
        bmiValue: bmiValue,
      );
}
