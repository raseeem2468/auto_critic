import 'package:auto_critic/screens/Admins/Adminlogin.dart';
import 'package:auto_critic/screens/login.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => const Login()),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.admin_panel_settings_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Welcome to AUTO CRITIC",
                style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => AdminLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
