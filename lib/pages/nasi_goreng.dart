import 'package:flutter/material.dart';
import 'popup_screen.dart';

class NasiGorengScreen extends StatefulWidget {
  @override
  _NasiGorengScreenState createState() => _NasiGorengScreenState();
}

class _NasiGorengScreenState extends State<NasiGorengScreen> {
  bool isLiked = false;

  void showPopup(BuildContext context) async {
    // Menampilkan popup, tunggu responnya
    bool? confirmed = await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => PopupScreen(),
    );

    // Jika user klik "Tambahkan", kirim data balik ke home.dart
    if (confirmed == true) {
      Navigator.pop(context, {
        'name': 'Nasi Goreng',
        'price': 15000,
        'image': 'images/nasi_goreng.jpg',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail: Nasi Goreng")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('images/nasi_goreng.jpg', height: 200),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nasi Goreng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              "Nasi goreng adalah makanan khas Indonesia yang terbuat dari nasi yang digoreng dengan bumbu-bumbu khas.",
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
