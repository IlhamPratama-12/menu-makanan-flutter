import 'package:flutter/material.dart';

// Model data nasi goreng
class NasiGorengItem {
  final String name;
  final String image;
  final String description;
  final int price;

  NasiGorengItem({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

final List<NasiGorengItem> nasiGorengList = [
  NasiGorengItem(
    name: 'Nasi Goreng Spesial',
    image: 'images/nasgor1.jpg',
    description: 'Nasi goreng dengan bumbu spesial, telur mata sapi, dan taburan bawang goreng.',
    price: 25000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Seafood',
    image: 'images/nasgor2.jpg',
    description: 'Nasi goreng dengan tambahan seafood segar seperti udang dan cumi.',
    price: 30000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Ayam',
    image: 'images/nasgor3.jpg',
    description: 'Nasi goreng dengan potongan ayam suwir dan sayuran segar.',
    price: 28000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Kampung',
    image: 'images/nasgor4.jpg',
    description: 'Nasi goreng tradisional dengan bumbu sederhana dan rasa yang autentik.',
    price: 20000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Pedas',
    image: 'images/nasgor5.jpg',
    description: 'Nasi goreng dengan tingkat kepedasan yang pas, cocok untuk pecinta pedas.',
    price: 27000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Vegetarian',
    image: 'images/nasgor6.jpg',
    description: 'Nasi goreng tanpa daging, hanya sayuran segar dan bumbu rempah.',
    price: 22000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Telur',
    image: 'images/nasgor7.jpg',
    description: 'Nasi goreng sederhana dengan telur orak-arik dan bumbu khas.',
    price: 24000,
  ),
  NasiGorengItem(
    name: 'Nasi Goreng Bakar',
    image: 'images/nasgor8.jpg',
    description: 'Nasi goreng yang dibakar dengan bumbu khas, memberikan aroma yang menggugah selera.',
    price: 29000,
  ),
];

class NasiGorengGalleryScreen extends StatelessWidget {
  final Function(Map<String, dynamic>)? onAddToCart;

  const NasiGorengGalleryScreen({Key? key, this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Varian Nasi Goreng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Nasi Goreng untukmu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: nasiGorengList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  var item = nasiGorengList[index];
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NasiGorengDetailScreen(item: item),
                        ),
                      );
                      if (result != null && result is Map<String, dynamic>) {
                        if (onAddToCart != null) {
                          onAddToCart!(result);
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Colors.black12,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NasiGorengDetailScreen extends StatelessWidget {
  final NasiGorengItem item;

  const NasiGorengDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(item.image, height: 250, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              item.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Harga: Rp ${item.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, {
                  'name': item.name,
                  'image': item.image,
                  'price': item.price,
                  'quantity': 1,
                });
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Tambah ke Keranjang'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
