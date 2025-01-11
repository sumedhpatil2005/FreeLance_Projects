import 'package:flutter/material.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});
  @override
  State<StatefulWidget> createState() => _Otppage();
}

class _Otppage extends State {
  final otplength = 4;
  final List<String> _images = [
    'assets/allassets/otpimage2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image Carousel
          SizedBox(
            height: 360,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                );
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(0, -15),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.53,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Enter the OTP we have sent you on",
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                        fontWeight: FontWeight.w200),
                  ),
                  const Text(
                    " 91+ ----------",
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 27, 27),
                        fontWeight: FontWeight.w200,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(otplength, (index) {
                      return SizedBox(
                        width: 50,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(193, 58, 202, 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )),
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Didn't Recieve OTP ?  Resend it!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
