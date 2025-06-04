import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cartItems.isEmpty) {
      return Center(child: Text('Keranjang masih kosong'));
    }

    return ListView.builder(
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        var item = widget.cartItems[index];
        return ListTile(
          leading: Image.asset(item['images'][0], width: 50, height: 50),
          title: Text(item['name']),
          subtitle: Text(item['price']),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeItem(index),
          ),
        );
      },
    );
  }
}
