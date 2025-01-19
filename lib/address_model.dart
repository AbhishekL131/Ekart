import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Address {
  final String id;
  final String name;
  final String phoneNumber;
  final String pincode;
  final String state;
  final String city;
  final String houseDetails;
  final String area;

  Address({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.pincode,
    required this.state,
    required this.city,
    required this.houseDetails,
    required this.area,
  });

  factory Address.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Address(
      id: doc.id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      pincode: data['pincode'] ?? '',
      state: data['state'] ?? '',
      city: data['city'] ?? '',
      houseDetails: data['houseDetails'] ?? '',
      area: data['area'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'pincode': pincode,
      'state': state,
      'city': city,
      'houseDetails': houseDetails,
      'area': area,
    };
  }
}

