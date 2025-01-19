import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    cart.add({...product, 'quantity': 1});
    notifyListeners();
    _saveCartToFirestore();
  }

  void removeProduct(Map<String, dynamic> product){
    cart.remove(product);
    notifyListeners();
    _saveCartToFirestore();
  }

  Future<void> _saveCartToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('carts')
          .doc(user.uid)
          .set({'cartItems': cart});
    }
  }

  Future<void> loadCartFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('carts')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        cart.clear();
        cart.addAll(List<Map<String, dynamic>>.from(doc['cartItems']));
        notifyListeners();
      }
    }
  }
}
