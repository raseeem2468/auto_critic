import 'package:auto_critic/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:auto_critic/screens/Admins/admin.dart';
import 'package:auto_critic/screens/forgrtpass.dart';
import 'package:auto_critic/screens/premiumlogo.dart';
import 'package:auto_critic/screens/singup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "lib/Assets/WhatsApp Image 2023-11-26 at 01.58.18_fc33f669.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CustomAppBar(),
                HeaderSection(),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const Admin()));
          },
          icon: const Icon(
            Icons.admin_panel_settings_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 323,
        ),
        Center(
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
        SizedBox(
          height: 120,
        ),
        Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 380),
                child: Text("Email",
                    style: TextStyle(fontSize: 26, color: Colors.white)),
              ),
              TextFormField(
                controller: _emailController,
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
                  labelText: ' Email ',
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
                padding: const EdgeInsets.only(right: 350),
                child: Text("Password",
                    style: TextStyle(fontSize: 26, color: Colors.white)),
              ),
              TextFormField(
                controller: _passwordController,
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await checkLogin(context);
                  } else {
                    print('data empty');
                  }
                },
                child: const Text('Login'),
              ),
              SizedBox(height: 60),
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const Signup()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.green, fontSize: 22),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const Forget()),
                  );
                },
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext ctx) async {
    final _email = _emailController.text;
    final _password = _passwordController.text;
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.setBool(SAVE_KEY_NAME, true);

    if (_email == storedEmail && _password == storedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => PremiumLogo()),
      );
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text('Incorrect username or password'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
