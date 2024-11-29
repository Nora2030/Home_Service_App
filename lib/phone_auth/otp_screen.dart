import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../my_home.dart';


class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  bool isLoadin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          child: Column(
            children: [
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Please enter the code we just sent.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey,
                  ),
                ),
              ),const SizedBox(height: 55,),
              TextField(
                style: const TextStyle(fontSize: 10),
                controller: otpController,
                keyboardType: TextInputType.phone,
                
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "Enter OTP code",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 20),
              isLoadin
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(backgroundColor: const Color(0xff6759FF)),
                  onPressed: () async {
                    setState(() {
                      isLoadin = true;
                    });
                    try {
                      final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpController.text,
                      );
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHome(),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isLoadin = false;
                    });
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}