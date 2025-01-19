import 'package:ekart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'checkoutscreen.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    await Provider.of<CartProvider>(context, listen: false).loadCartFromFirestore();
  }



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    void _showCheckoutBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          double totalAmount = 0;
          for (var item in cart) {
            totalAmount += item['price'] * (item['quantity'] ?? 1);
          }

          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CheckoutScreen(
                          cartItems: cart,
                          totalAmount: totalAmount,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.white, size: 25),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return CartItem(
              image: cartItem['imageUrl'].toString(),
              title: cartItem['title'].toString(),
              size: cartItem['size'].toString(),
              price: cartItem['price'].toString(),
              onPressed: (){
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text("Remove Product"),
                      content: const Text("Are you sure?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
          );
        },
      ),
      floatingActionButton: Padding(

        padding: const EdgeInsets.only(right: 10.0),
        child: FloatingActionButton.extended(
          onPressed: _showCheckoutBottomSheet,
          backgroundColor: Colors.blue,
          label: const Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
