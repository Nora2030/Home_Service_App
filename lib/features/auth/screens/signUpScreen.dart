import 'package:flutter/material.dart';
import '../../../LogIn with google/google_auth.dart';
import 'signInScreen.dart';
import '../../../forgetpassword/forgetpassword.dart';
import '../../../phone_auth/phone_login.dart';
import 'complete_reg.dart';
import '../../../my_home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visible = true;
  final AuthService _authService=AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to validate email format
  String? validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Email address must not be empty";
    } else if (!regex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  // Function to validate password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password must not be empty";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }
  void _register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;

    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      await _authService.registerWithEmail(email, password, username);
      print(_emailController.text);
      print(_passwordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompleteReg(),
        ),
      );

    } else {
      print("Please fill in all fields");
    }
  }

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                left: 24.0,
                bottom: 24.0,
                right: 24.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Fill your information below or register" ,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  Text("with your social account",style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    TextFormField(
                      controller: _usernameController,
                      style: TextStyle(fontSize: 10),
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Enter Your Username",
                        labelText: "your name",
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text("Email"),
                    TextFormField(
                      style: TextStyle(fontSize: 10),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(value!),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "example@gmail.com",
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Password"),
                    TextFormField(
                      style: TextStyle(fontSize: 10),
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visible,
                      validator: (value) => validatePassword(value!),
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              visible = !visible;
                              setState(() {});
                            },
                            icon: visible == true
                                ? const Icon(
                              Icons.remove_red_eye,
                            )
                                : const Icon(
                              Icons.visibility_off,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: ForgotPassword()),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _register();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6759FF),
                        minimumSize: Size(double.infinity,
                            50), // Set minimum width and height
                      ),
                      child: const Text(
                        "sign up",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Or sign up with",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () async {
                          await _authService.signInWithGoogle();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHome(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Image.asset(
                                "assets/images/1.png",
                                height: 45,
                                width: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    const PhoneAuthentication(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                color: Color(0xff6759FF),
                                fontSize: 18,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
