import 'package:example_project/models/userHealthInfo.dart';
import 'package:example_project/viewModels/bmi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListView extends ConsumerWidget {
  const UserListView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<UserHealthInfo> users = ref.watch(userHealthProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child:
                    // child: false
                    //     ? ListView(children: [
                    //         for (final user in users)
                    //           ListTile(
                    //             title: Text('$user.bmiValue'),
                    //             subtitle: Text(user.name),
                    //           )
                    //       ])
                    Text("No data")),
            ElevatedButton(
              child: Text("Calculate"),
              onPressed: () => {Navigator.pushNamed(context, '/calculate')},
            )
          ],
        )));
  }
}
