import 'package:flutter/material.dart';
import '../pages/home.dart'; 
class LoginPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Text('Welcome to', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('PRAKTIKUM PAB 2023', style: TextStyle(fontSize: 18)),

                SizedBox(height: 75),
                Text('1462200163', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                SizedBox(height: 50),
                Image.asset(
                  'assets/images/profil_satu.jpg',
                  width: 230,
                  height: 430,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 35),
                Text('Mohammad Ilham Zulva Pratama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                SizedBox(height: 75),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 4, 160, 56),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Masuk', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
