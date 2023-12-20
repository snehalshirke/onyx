import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onyx/res/components/round_button.dart';
import 'package:onyx/utils/routes/routes_name.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final FocusNode _firstTextFieldFocusNode = FocusNode();
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool isButtonEnabled = false;
  Timer? _timer;
  int _secondsRemaining = 30;
  bool isTimerRunning = false;
  String correctOtp = '101010';
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
    _firstTextFieldFocusNode.requestFocus();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(updateButtonState);
    }
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String formatTime(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(1, "0");
    return "${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle back button press
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                ),
                const SizedBox(width: 80),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logoimg.jpg',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      height: 4,
                      width: 15,
                    ),
                    const Text(
                      "LOGO",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Background with curve and grey color
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text at the top of the background
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: const Text(
                      "Enter The Verification Code Sent To",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontFamily: 'Lato-Light.ttf',
                      ),
                    ),
                  ),

                  // Row with text and pencil icon
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle text tap
                        },
                        child: const Text(
                          "9867716283",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 1,
                      ),
                      // GestureDetector for the icon
                      GestureDetector(
                        onTap: () {
                          // Handle icon tap
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  // Row with 6 TextFields
                  const SizedBox(height: 80),
                  RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (RawKeyEvent event) {
                      // Handle backspace key
                      if (event is RawKeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.backspace) {
                        for (int i = _controllers.length - 1; i >= 0; i--) {
                          if (_controllers[i].text.isNotEmpty) {
                            _controllers[i].clear();
                            if (i > 0) {
                              _focusNodes[i - 1].requestFocus();
                            }
                            break;
                          }
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 40.0,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: TextStyle(
                              fontSize: 18,
                              color: showError && isButtonEnabled
                                  ? Colors.red
                                  : Colors
                                      .black, // Change text color based on showError
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              // Change border color based on showError
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: showError && isButtonEnabled
                                        ? Colors.red
                                        : Colors.black),
                              ),
                              counterText: "", // Remove the character count
                              // Change error text color based on showError
                              errorStyle: TextStyle(
                                color:
                                    showError ? Colors.red : Colors.transparent,
                              ),
                            ),
                            onChanged: (value) {
                              // Trim the input and move focus accordingly
                              value = value.trim();
                              if (value.isEmpty) {
                                if (index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                              } else if (value.length == 1) {
                                if (index < 5) {
                                  _focusNodes[index + 1].requestFocus();
                                }
                              }
                              updateButtonState(); // Update the button state when any text changes
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: showError && isButtonEnabled,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Invalid Code.Please Enter A Valid Code.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Row with text and timer
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          startTimer();
                          setState(
                            () {
                              isTimerRunning = true;
                            },
                          );
                        },
                        child: Text(
                          "Resend OTP in ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      // Display the formatted remaining time
                      Text(
                        isTimerRunning ? formatTime(_secondsRemaining) : '0:00',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  // Text with underline
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Handle text tap
                        startTimer();
                        setState(
                          () {
                            isTimerRunning = true;
                          },
                        );
                      },
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0, -1),
                            )
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  // Full-width button
                  const SizedBox(height: 50),
                  RoundButton(
                    title: 'Send OTP',
                    onPress: () {
                      if (isButtonEnabled) {
                        // Check if entered OTP is correct
                        if (_controllers
                                .map((controller) => controller.text)
                                .join() ==
                            correctOtp) {
                          // Correct OTP, navigate to the next page
                          Navigator.pushNamed(context, RoutesName.home);
                          setState(
                            () {
                              showError = false;
                            },
                          );
                        } else {
                          // Incorrect OTP, show error message and make fields red
                          setState(
                            () {
                              showError = true;
                            },
                          );
                        }
                      }
                    },
                    color: isButtonEnabled ? Colors.black : Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    _timer?.cancel(); // Cancel the previous timer if it exists
    _secondsRemaining = 30;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (_secondsRemaining > 0) {
              _secondsRemaining--;
            } else {
              _timer?.cancel(); // Cancel the timer when it reaches 0
              isTimerRunning = false;
            }
          },
        );
      },
    );
  }
}
