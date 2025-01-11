import 'package:flutter/material.dart';

class details extends StatefulWidget {
  details({super.key});
  @override
  State createState() => _details();
}

class _details extends State {
  TextEditingController Name = TextEditingController();
  TextEditingController House = TextEditingController();
  TextEditingController Society = TextEditingController();
  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text("Enter User Details"),
                SizedBox(height: 20),
                Text("Enter Your Name"),
                TextField(
                  controller: Name,
                  decoration: InputDecoration(),
                ),
                Text("Enter Your Flat No. and Building No."),
                TextField(
                  controller: House,
                ),
                Text("Enter Your Society Name"),
                TextField(
                  controller: Society,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
