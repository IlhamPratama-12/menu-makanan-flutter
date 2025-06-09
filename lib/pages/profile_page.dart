import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data profil
    final String nama = "Mohammad Ilham Zulva Pratama";
    final String nbi = "1462200163";
    final String kelas = "PAB-D";
    final String alamat = "Pasururan, Jawa Timur";
    final String instagram = "@ilham.z.pratama";

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
            Positioned(
              top: 60,
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue[300],
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.person, color: Colors.blue),
          title: Text(nama),
        ),
        ListTile(
          leading: Icon(Icons.badge, color: Colors.blue),
          title: Text('NBI: $nbi'),
        ),
        ListTile(
          leading: Icon(Icons.class_, color: Colors.blue),
          title: Text('Kelas: $kelas'),
        ),
        ListTile(
          leading: Icon(Icons.location_on, color: Colors.blue),
          title: Text(alamat),
        ),
        ListTile(
          leading: Icon(Icons.camera_alt, color: Colors.blue),
          title: Text(instagram),
        ),
      ],
    );
  }
}
