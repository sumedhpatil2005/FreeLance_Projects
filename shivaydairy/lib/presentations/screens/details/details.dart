import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});
  @override
  State createState() => _details();
}

class _details extends State {
  TextEditingController name = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController society = TextEditingController();
  void openBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Enter Delivery Address",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Enter Your Name",
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Enter Your Flat No. and Building No.",
                              style: TextStyle(color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: house,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Enter Your Society Name",
                              style: TextStyle(color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                              controller: society,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 35),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: const Text("Submit",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => openBottomSheet(),
        child: Center(
          child: Container(
            height: 50,
            width: 100,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
