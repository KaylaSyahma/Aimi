import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Focus untuk Text Form Field
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isUsernameFocused = false;

  final FToast fToast = FToast();

  @override
  void initState() {
  super.initState();
  fToast.init(context); // Inisialisasi fToast di sini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/login_register_bg.png',
                  height: 180,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Sign Up For Free",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        // Shadow hanya muncul saat fokus
                        if (isEmailFocused)
                          BoxShadow(
                            color: const Color(0xFF9BB168).withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(4, 4),
                          ),
                      ],
                    ),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          isEmailFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        controller: _emailController,
                        onTap: () {
                          setState(() {
                            isEmailFocused = true;
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            isEmailFocused = false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "*Email",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!value.endsWith("@gmail.com")) {
                            return "Please fill with valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        // Shadow hanya muncul saat fokus
                        if (isUsernameFocused)
                          BoxShadow(
                            color: const Color(0xFF9BB168).withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(4, 4),
                          ),
                      ],
                    ),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          isUsernameFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        controller: _nameController,
                        onTap: () {
                          setState(() {
                            isUsernameFocused = true;
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            isUsernameFocused = false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "*Username",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required";
                          }
                          if (value.length < 5) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        // Shadow hanya muncul saat fokus
                        if (isPasswordFocused)
                          BoxShadow(
                            color: const Color(0xFF9BB168).withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(4, 4),
                          ),
                      ],
                    ),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() {
                          isPasswordFocused = hasFocus;
                        });
                      },
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        onTap: () {
                          setState(() {
                            isPasswordFocused = true;
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            isPasswordFocused = false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "*Password",
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: secondaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        fToast.showToast(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              "Successfully created an account!",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          gravity: ToastGravity.BOTTOM,
                          toastDuration: const Duration(seconds: 2),
                        );
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800
                            ),
                          ),
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 35,
                          color: Colors.white,
                        )
                      ],
                    )
                  ),
                  const SizedBox(height: 30),
                  // Link ke Login
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In.',
                            style: TextStyle(
                              color: tertiaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
