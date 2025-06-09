import 'package:flutter/material.dart';
import 'nasi_goreng.dart';
import 'mie_ayam.dart';
import 'sate_ayam.dart';
import 'keranjang.dart';
import '../auth/login_page.dart';
import 'profile_page.dart';  // Import yang benar

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> cartItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCart(Map<String, dynamic> item) {
    setState(() {
      int existingIndex =
          cartItems.indexWhere((element) => element['name'] == item['name']);
      if (existingIndex >= 0) {
        cartItems[existingIndex]['quantity'] =
            (cartItems[existingIndex]['quantity'] ?? 1) + 1;
      } else {
        cartItems.add({
          ...item,
          'quantity': 1,
        });
      }
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildHomeContent(),
      CartPage(cartItems: cartItems),
      const ProfilePage(),  // Ini yang dari profile_page.dart
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("SESI-03"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _logout,
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => _onItemTapped(1),
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int? ?? 1))}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          "Menu Makanan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),

        /// Nasi Goreng
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NasiGorengGalleryScreen(
                  onAddToCart: (item) {
                    _addToCart(item);
                  },
                ),
              ),
            );
          },
          child: _buildMenuCard("Nasi Goreng", "images/nasi_goreng.jpg"),
        ),

        /// Mie Ayam
        GestureDetector(
          onTap: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MieAyamScreen()),
            );
            if (result != null && result is Map<String, dynamic>) {
              _addToCart(result);
            }
          },
          child: _buildMenuCard("Mie Ayam", "images/mie_ayam.jpg"),
        ),

        /// Sate Ayam
        GestureDetector(
          onTap: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SateAyamScreen()),
            );
            if (result != null && result is Map<String, dynamic>) {
              _addToCart(result);
            }
          },
          child: _buildMenuCard("Sate Ayam", "images/sate_ayam.jpg"),
        ),
      ],
    );
  }

  Widget _buildMenuCard(String title, String imagePath) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 16),
          Text(title, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
