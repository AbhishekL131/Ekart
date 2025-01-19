import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'address_model.dart';

class AddressProvider extends ChangeNotifier {
  final CollectionReference _addressesCollection =
  FirebaseFirestore.instance.collection('addresses');

  List<Address> _addresses = [];
  List<Address> get addresses => _addresses;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadAddresses(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      QuerySnapshot snapshot = await _addressesCollection.where('userId', isEqualTo: userId).get();
      _addresses = snapshot.docs.map((doc) => Address.fromFirestore(doc)).toList();
    } catch (e) {

      print("Error loading addresses: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addAddress(String userId, Address address) async {
    await _addressesCollection.add({
      ...address.toMap(),
      'userId': userId,
    });
    await loadAddresses(userId); // Reload addresses after adding
  }
}