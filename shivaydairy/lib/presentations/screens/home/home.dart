import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shivaydairy/data/models/modalclass.dart';
import 'package:shivaydairy/presentations/screens/cart/cartpage.dart';
import 'package:shivaydairy/presentations/screens/details/details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State createState() => _Home();
}

class _Home extends State {
  final int _selectedindex = 1;

  void openBottomSheet(
    BuildContext context,
  ) {
    // Variable to hold the quantity
    int quantity = 1;
    int price = 37;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            var totalPrice = price * quantity;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Product Image and Name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 211, 211),
                          ),
                        ),
                        height: 170,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            Products[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Product Name
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Text(
                          Products[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 49, 49, 49),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Product Size
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 5, 0, 0),
                        child: Text(
                          Products[index].weight,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 115, 113, 113),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Quantity Selector (Plus and Minus Buttons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Select Quantity",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 49, 49, 49),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Text(
                              "$quantity",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Price (Optional: You can add product price here)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        child: Text(
                          "\$${totalPrice.toStringAsFixed(2)}", // Example price
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(83, 177, 117, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Add to Cart Button
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                              context); // Close the bottom sheet after adding to cart
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                              83, 177, 117, 1), // Button color
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Cartpage(),
    const details(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hello, User",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
        backgroundColor: const Color.fromRGBO(83, 177, 117, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 208, 205, 205),
                ),
                height: 200,
                width: 340,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Products ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 5, 5))),
                ),
              ],
            ),
            SizedBox(
              height: 370,
              width: 335,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: Products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color.fromARGB(255, 244, 238, 238)),
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            height: 80,
                            width: 130,
                            child: Image.asset(Products[index].imageUrl),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Text(
                                  Products[index].name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Text(
                                  Products[index].weight,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 115, 113, 113),
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Text(
                                  Products[index].price.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  return openBottomSheet(
                                    context,
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8.0, 0, 5, 0),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.white),
                                      color:
                                          const Color.fromRGBO(83, 177, 117, 1),
                                    ),
                                    child: const Icon(
                                      Icons.add_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
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
              backgroundColor: const Color.fromRGBO(83, 177, 117, 1),
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(83, 177, 117, 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.yellow),
                          child: Image.asset(
                              "assets/allassets/User_assets/profile.jpg"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Lorem Ipsum")
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: const Text('My Subscriptions',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Home navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text('My Orders',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Settings navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text('Delivery Address',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Settings navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: const Text('About Us',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Settings navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 144, 26, 17),
                    ),
                    title: const Text('Logout',
                        style: TextStyle(
                            color: Color.fromARGB(255, 144, 26, 17),
                            fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: Container(
        height: 45,
        color: const Color.fromARGB(255, 248, 246, 246),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: _buildBottomNavItem(
                const FaIcon(FontAwesomeIcons.house, size: 10),
                'Home',
                0,
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1), // Removed Navigator.push()
              child: _buildBottomNavItem(
                const FaIcon(FontAwesomeIcons.shoppingCart, size: 10),
                'Cart',
                1,
              ),
            ),
            
            GestureDetector(
              onTap: () => _onItemTapped(2), // Removed Navigator.push()
              child: _buildBottomNavItem(
                const FaIcon(FontAwesomeIcons.user, size: 10),
                'Profile',
                2,
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2), // Removed Navigator.push()
              child: _buildBottomNavItem(
                const FaIcon(FontAwesomeIcons.firstOrder, size: 10),
                'Orders',
                3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(FaIcon icon, String label, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FaIcon(
          icon.icon,
          color: _selectedIndex == index
              ? const Color.fromRGBO(83, 177, 117, 1)
              : const Color.fromARGB(255, 81, 81, 81),
        ),
        Text(
          label,
          style: TextStyle(
            color: _selectedIndex == index
                ? const Color.fromRGBO(83, 177, 117, 1)
                : const Color.fromARGB(255, 21, 21, 21),
          ),
        ),
      ],
    );
  }
}
