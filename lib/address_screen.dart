import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'address_provider.dart';
import 'add_delivery_address.dart';
import 'firebase_auth_methods.dart'; // Assuming you have an auth provider

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = context.watch<FirebaseAuthMethods>().user.uid;
    final addressProvider = Provider.of<AddressProvider>(context, listen: false);

    // Load addresses on screen load
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      addressProvider.loadAddresses(userId);
    });

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Addresses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Material(
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddDeliveryAddress(),
                  ),
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "+ Add a new address",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Expanded(
            child: Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                if (addressProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (addressProvider.addresses.isEmpty) {
                  return Center(child: Text(
                      "No addresses found",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ));
                } else {
                  return ListView.builder(
                    itemCount: addressProvider.addresses.length,
                    itemBuilder: (context, index) {
                      final address = addressProvider.addresses[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Material(
                          elevation: 2,
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                address.name,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text("${address.houseDetails}, ${address.area}", style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 5),
                                  Text("${address.city}, ${address.state} - ${address.pincode}",style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 10),
                                  Text(address.phoneNumber, style: TextStyle(fontSize: 16)),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
