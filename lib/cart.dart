import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/cart_Changeprovider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartChangeprovider>(context);
    final cartItems = cartProvider.cartDetails;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart Details',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          cartItems.isEmpty
              ? const Center(child: Text('No items in cart.'))
              : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item['imageUrl']),
                    ),
                    title: Text(item['name']),
                    subtitle: Text('\$ ${item['price']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: (context),
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete This item.'),
                              content: Text(
                                'Do you want to delete this item ?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Provider.of<CartChangeprovider>(
                                      context,
                                      listen: false,
                                    ).removeProduct(
                                      item['imageUrl'],
                                      item['name'],
                                      item['price'],
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
