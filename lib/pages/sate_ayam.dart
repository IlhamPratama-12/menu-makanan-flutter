import 'package:flutter/material.dart';
import 'popup_screen.dart';

class SateAyamScreen extends StatefulWidget {
  @override
  _SateAyamScreenState createState() => _SateAyamScreenState();
}

class _SateAyamScreenState extends State<SateAyamScreen> {
  bool isLiked = false;

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), 
      builder: (context) => PopupScreen(),
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail: Sate Ayam")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('images/sate_ayam.jpg', height: 200),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sate Ayam", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              "Sate ayam adalah makanan khas Indonesia yang terdiri dari potongan daging ayam yang ditusuk dan dibakar.",
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => showPopup(context),
              child: Text("Add to card"),
            ),
          ],
        ),
      ),
    );
  }
}
