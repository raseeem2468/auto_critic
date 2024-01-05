import 'package:auto_critic/screens/login.dart';
import 'package:auto_critic/screens/singup.dart';
import 'package:flutter/material.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.8;

    ElevatedButton buildButton(String label, VoidCallback onPressed) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "AUTO CRITIC",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 32),
            ),
            Image.asset("lib/Assets/ce2be0abbe07141b521adc96ceb45c4e.jpg"),
            const SizedBox(height: 30),
            SizedBox(
              width: buttonWidth,
              child: buildButton(
                "Login",
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Login()),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: buildButton(
                "Sign UP ",
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Signup()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
