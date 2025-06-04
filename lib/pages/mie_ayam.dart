import 'package:flutter/material.dart';
import 'popup_screen.dart';

class MieAyamScreen extends StatefulWidget {
  @override
  _MieAyamScreenState createState() => _MieAyamScreenState();
}

class _MieAyamScreenState extends State<MieAyamScreen> {
  bool isLiked = false;

  void showPopup(BuildContext context) async {
    // Menampilkan popup, tunggu responnya
    bool? confirmed = await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => PopupScreen(),
    );

    if (confirmed == true) {
      Navigator.pop(context, {
        'name': 'Mie Ayam',
        'price': 15000,
        'image': 'images/mie_ayam.jpg',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail: Mie Ayam")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('images/mie_ayam.jpg', height: 200),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mie Ayam", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.favorite, color: isLiked ? Colors.red : Colors.grey),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Mie goreng adalah makanan khas Indonesia yang terbuat dari nasi yang digoreng dengan bumbu-bumbu khas.",
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => showPopup(context),
              child: Text("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
}
