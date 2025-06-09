  import 'package:flutter/material.dart';

  class NasiGorengDetailScreen extends StatelessWidget {
    final Map<String, dynamic> item;

    const NasiGorengDetailScreen({super.key, required this.item});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(item['name']),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(
                item['description'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Harga: Rp ${item['price']}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, item); // Kembali ke HomePage dengan data item
                  },
                  child: Text('Tambah ke Keranjang'),
                ),
              ),
            ],
          ),
        ),
      );
    }   
  }
