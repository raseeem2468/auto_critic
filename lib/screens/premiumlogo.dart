import 'package:auto_critic/screens/login_or_singup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumLogo extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text("PREMIUM CAR LOGO"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Save'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                dialogView(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 40),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 09.52.11_64781a4e.jpg",
                      width: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 35),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.18.45_45dc41d8.jpg",
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 80),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 09.54.44_271cdbe1.jpg",
                      width: 70,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, top: 10),
                  child: Text("LAMBORGHINI"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90, top: 10),
                  child: Text("PORSCHE"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110, top: 10),
                  child: Text("FERARRI"),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 100),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.02.25_4e1f007c.jpg",
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95, left: 75),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-12-06 at 12.40.44_207a1c41.jpg",
                      width: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 50),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.13.39_4e192b76.jpg",
                      width: 160,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70, top: 10),
                  child: Text("BMW"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100, top: 10),
                  child: Text("MERCEDES BENZ"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 85, top: 10),
                  child: Text("VOLKSWAGEN"),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 80),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 09.56.57_abcbcc2a.jpg",
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.05.17_6334c246.jpg",
                      width: 180,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 95,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.18.45_87a873a6.jpg",
                      width: 120,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, top: 10),
                  child: Text("ROLLS-ROYCE"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90, top: 10),
                  child: Text("MINI COOPER"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110, top: 10),
                  child: Text("AUDI"),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 80),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.43.33_3683153f.jpg",
                      width: 140,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95, left: 35),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.43.33_ed77f79a.jpg",
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95, left: 40),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/Assets/WhatsApp Image 2023-11-27 at 10.43.34_a235cbb4.jpg",
                      width: 120,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 75,
                  ),
                  child: Text("BUGATTI"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 110,
                  ),
                  child: Text("LEXUS"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 115,
                  ),
                  child: Text("MCLAREN"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void dialogView(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await SharedPreferences.getInstance();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginSignUp(),
                ),
                (route) => false,
              );
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
