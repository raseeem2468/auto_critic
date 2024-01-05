import 'package:auto_critic/screens/login_or_singup.dart';
import 'package:auto_critic/screens/premiumlogo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY_NAME = 'userLoggin';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Image.asset(
            'lib/Assets/WhatsApp Image 2023-11-26 at 01.41.30_b4098236.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => LoginSignUp()),
    );
  }

  Future<void> checkUserLoggin() async {
    final _sharedpref = await SharedPreferences.getInstance();
    final _userLoggin = _sharedpref.getBool(SAVE_KEY_NAME);
    if (_userLoggin == null || _userLoggin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => PremiumLogo(),
        ),
      );
    }
  }
}
