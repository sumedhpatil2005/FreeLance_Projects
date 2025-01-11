import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State createState() => _Home();
}

class _Home extends State {
  int _selectedindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar:
            AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        drawer: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Drawer(
                width: 200,
                elevation: 100,
                backgroundColor: Colors.blue,
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.yellow),
                            child: Image.asset("assets/allassets/profile.jpg"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Lorem Ipsum")
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Subscription'),
                      onTap: () {
                        // Handle Home navigation
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Orders'),
                      onTap: () {
                        // Handle Settings navigation
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('History'),
                      onTap: () {
                        // Handle Settings navigation
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Bills'),
                      onTap: () {
                        // Handle Settings navigation
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        // Handle Logout
                      },
                    ),
                  ],
                ),
              ),
            )),
        bottomNavigationBar: CurvedNavigationBar(
            index: _selectedindex,
            height: 50,
            items: const [
              Column(
                children: [Icon(Icons.home, size: 30), Text("Home")],
              ),
              Column(
                children: [Icon(Icons.search, size: 30), Text("Search")],
              ),
              Column(
                children: [Icon(Icons.shopping_cart, size: 30), Text("Cart")],
              ),
              Column(
                children: [
                  Icon(Icons.account_circle, size: 30),
                  Text("Account")
                ],
              ),
              // Home icon
              // Search icon
            ],
            color: const Color.fromARGB(255, 193, 199, 204),
            buttonBackgroundColor: Colors.blue,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _selectedindex = index;
              });
            }));
  }
}
