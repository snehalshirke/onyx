import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          //  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Title
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                          height: 80,
                        ),
                        const Text(
                          'LOGO',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'IBMPlexSansCondensed-SemiBold.ttf',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Welcome Text
                    const Visibility(
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'IBMPlexSansCondensed-SemiBold.ttf',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Instruction Text
                    Text(
                      'Please enter mobile number to receive an OTP',
                      style: TextStyle(
                        fontFamily: 'Barlow-ExtraLight.ttf',
                        color: Colors.grey.shade800,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Mobile Number Text and TextField
                    Text(
                      'Your Mobile Number*',
                      style: TextStyle(
                        fontFamily: 'Barlow-ExtraLight.ttf',
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _mobileNumberController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10, // Limit input to 10 digits
                    ),
                    const SizedBox(height: 30),
                    // Referral Code Text
                    GestureDetector(
                      onTap: () {
                        _showReferralCodePopup(context);
                      },
                      child: Visibility(
                        visible: isvisible,
                        child: Text(
                          "Have A Referral code ?",
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.blue.shade700,
                                offset: const Offset(0, -5),
                              )
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                const Color.fromARGB(255, 0, 52, 196),
                            decorationThickness: 1,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Agreement Text and Checkbox
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? value) {}),
                        Flexible(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'Barlow-ExtraLight.ttf',
                                fontSize: 14,
                                letterSpacing: 0.01,
                                color: Colors.grey, // Default text color
                              ),
                              children: [
                                TextSpan(
                                  text: 'By continuing, you agree to our\'s\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Use ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 320),
                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                          // Handle button press
                          // Navigator.pop(context);
                          if (_mobileNumberController.text.length == 10) {
                            Navigator.pushNamed(context, 'otpverification');
                          } else {
                            Fluttertoast.showToast(
                              msg: "Please Enter Valid Mobile Number",
                              toastLength: Toast
                                  .LENGTH_SHORT, // Duration for which the toast should be visible
                              gravity: ToastGravity
                                  .BOTTOM, // Position of the toast message on the screen
                              timeInSecForIosWeb:
                                  1, // Time for which the message will be displayed on the screen
                              backgroundColor: Colors
                                  .red, // Background color of the toast message
                              textColor: Colors
                                  .white, // Text color of the toast message
                              fontSize:
                                  16.0, // Font size of the toast message text
                            );
                          }
                        },
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 16), // Adjust padding as needed
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            _mobileNumberController.text.length == 10
                                ? Colors.black
                                : Colors
                                    .grey, // Change the color here based on condition
                          ),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'IBMPlexSansCondensed-SemiBold.ttf',
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  void _showReferralCodePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(
              20, 20, 25, 20), // Adjust padding as needed
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Enter Referral Code',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                width: 50,
                height: 40,
              ), // Adjust the space between text and icon button
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the popup
                },
              ),
            ],
          ),
          content: const SizedBox(
            width: 50,
            height: 70, // Set your desired width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        5), // Adjust the space between textfield and close icon
              ],
            ),
          ),
        );
      },
    );
  }
}
