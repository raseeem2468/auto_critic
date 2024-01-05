import 'package:auto_critic/database/model/user_model.dart';
import 'package:auto_critic/screens/login_or_singup.dart';
import 'package:auto_critic/screens/premiumlogo.dart';
import 'package:auto_critic/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "lib/Assets/WhatsApp Image 2023-11-26 at 02.16.50_09387b27.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                _buildHeaderSection(),
                _buildLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 440),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(builder: (ctx) => LoginSignUp()),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 297,
        ),
        const Center(
          child: Text(
            "AUTO CRITIC",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        const Text(
          "Sign up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 380),
                child: Text("Name",
                    style: TextStyle(fontSize: 26, color: Colors.white)),
              ),
              TextFormField(
                controller: nameController,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 390),
                child: Text("Email",
                    style: TextStyle(fontSize: 26, color: Colors.white)),
              ),
              TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 335),
                child: Text("Password",
                    style: TextStyle(fontSize: 28, color: Colors.white)),
              ),
              TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _signUp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 60),
              const Text("Already have an account?",
                  style: TextStyle(fontSize: 28, color: Colors.white)),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (ctx) => LoginSignUp()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    if (formKey.currentState!.validate()) {
      final UserModel newUser = UserModel(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      addUser(newUser);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => PremiumLogo()),
      );
    }
  }

  void addUser(UserModel user) {
    print('New user registered: ${user.username}, ${user.email}');
  }
}
