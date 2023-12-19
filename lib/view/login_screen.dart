import 'package:flutter/material.dart';
import 'package:onyx/res/components/round_button.dart';
import 'package:onyx/utils/routes/routes_name.dart';
import 'package:onyx/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  bool isChecked = false;
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height + 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Title
              Row(
                children: [
                  Image.asset(
                    'assets/images/logoimg.jpg',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Onyx',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato-Bold.ttf',
                        height: 1.3,
                        letterSpacing: 0.8),
                  ),
                ],
              ),
              // Welcome Text
              const Padding(
                padding: EdgeInsets.fromLTRB(6, 15, 0, 0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Lato-Bold.ttf',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Instruction Text
              Text(
                'Please enter mobile number to receive an OTP',
                style: TextStyle(
                  fontFamily: 'Lato-Light.ttf',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 25),
              // Mobile Number Text and TextField
              Text(
                'Your Mobile Number*',
                style: TextStyle(
                  fontFamily: 'Lato-Light.ttf',
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 1.2,
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
                      decorationColor: const Color.fromARGB(255, 0, 52, 196),
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
                  Checkbox(
                    value: isChecked,
                    activeColor:
                        isChecked ? Colors.black : null, // Set the active color
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Lato-Light.ttf',
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
                              fontWeight: FontWeight.w500,
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 240),
              // Submit Button
              SizedBox(
                height: height * .085,
              ),
              RoundButton(
                title: 'Send OTP',
                onPress: () {
                  if (_mobileNumberController.text.isEmpty) {
                    Utils.flushbarErrorMessage('Please enter number', context);
                  } else if (_mobileNumberController.text.length < 10) {
                    Utils.flushbarErrorMessage(
                        'Please enter valid number', context);
                  } else if (!isChecked) {
                    Utils.flushbarErrorMessage(
                        'Please agree to the terms and conditions', context);
                  } else {
                    // ========== api call ==========
                    // Map data = {
                    //   'email': _emailcontroller.text.toString(),
                    //   'password': _passwordcontroller.text.toString(),
                    // };
                    // authViewMode.loginApi(data, context);
                    Navigator.pushNamed(context, RoutesName.otpVerification);
                  }
                },
                color: _mobileNumberController.text.length >= 10 && isChecked
                    ? Colors.black
                    : Colors.grey,
              ),
            ],
          ),
        ),
      ),
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
