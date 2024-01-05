import 'package:auto_critic/screens/Admins/Adminlogoadd.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            _buildHeading("Admin Login"),
            _buildLoginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 300,
      child: Center(
        child: Text(
          "AUTO CRITIC",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return SizedBox(
      height: 150,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 34,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFormField(
                "Email", _emailController, TextInputType.emailAddress),
            _buildFormField(
                "Password", _passwordController, TextInputType.visiblePassword,
                isPassword: true),
            SizedBox(height: 20),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String labelText, TextEditingController controller,
      TextInputType keyboardType,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(color: Colors.black, fontSize: 26)),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $labelText';
            } else if (isPassword && value.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (!isPassword &&
                !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    .hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Enter your $labelText',
            labelText: labelText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('admin_email', email);
    prefs.setString('admin_password', password);
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final email = _emailController.text.trim();
          final password = _passwordController.text.trim();
          if (email == "raseem9009@gmail.com" && password == 'raseem123') {
            await _saveCredentials(email, password);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => AdminLogoAdd()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid email or password'),
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
