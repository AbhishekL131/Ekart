import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekart/address_screen.dart';
import 'package:ekart/help_center.dart';
import 'package:ekart/options_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_methods.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authMethods = Provider.of<FirebaseAuthMethods>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: FutureBuilder<DocumentSnapshot?>(
          future: authMethods.getUserData(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('User data not found.'));
            } else {
              String userName = snapshot.data!['Name']; // Assuming 'Name' is the field in Firestore
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text(
                          "Hey! $userName",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )

                      ],
                    ),
                  ),
                  Options(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionsContainer(text: "My Orders", icon: Icons.backpack, onPressed: (){}),
        OptionsContainer(
          text: "My Addresses",
          icon: Icons.book,
          onPressed: () {
           Navigator.of(context).push(
             MaterialPageRoute(
                 builder: (context) => AddressScreen()
             )
           );
          },
        ),
        OptionsContainer(
            text: "Help Center",
            icon: Icons.help_center_outlined,
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => HelpCenter()
                )
              );
            }),
        OptionsContainer(
          text: "Sign Out",

          icon: Icons.logout,
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text("Sign Out"),
                  content: Text("Are you sure?"),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await context.read<FirebaseAuthMethods>().signOut(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
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
                      child: Text(
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
          },
        ),
        OptionsContainer(
          text: "Delete account",
          icon: Icons.delete_outline_rounded,
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text("Delete account"),
                  content: Text("Are you sure?"),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await context.read<FirebaseAuthMethods>().deleteAccount(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
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
                      child: Text(
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
          },
        ),
      ],
    );
  }
}

