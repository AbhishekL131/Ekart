

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Text(
          "Help Center",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),

        leading: Icon(Icons.help_outline,color: Colors.white,size: 25,),
      ),




      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 30,),
                 label: Text(
                   "Search for Help",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                   ),
                 ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blueAccent
                    )
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(
              title: Text('Account',style: TextStyle(
                fontSize: 18
              ),),
              leading: Icon(Icons.account_circle),
              onTap: () {
                // Navigate to Account Help
              },
            ),
            ListTile(
              title: Text('Payments',style: TextStyle(
                fontSize: 18
              ),),
              leading: Icon(Icons.payment),
              onTap: () {
                // Navigate to Payments Help
              },
            ),
            ListTile(
              title: Text('Troubleshooting',style: TextStyle(
                fontSize: 18
              ),),
              leading: Icon(Icons.build),
              onTap: () {
                // Navigate to Troubleshooting Help
              },
            ),
            SizedBox(height: 20),
            Text('FAQs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(
              title: Text('How do I reset my password?',style: TextStyle(
                fontSize: 18
              ),),
              onTap: () {
                // Show answer
              },
            ),
            ListTile(
              title: Text('How do I contact support?',style: TextStyle(
                fontSize: 18
              ),),
              onTap: () {
                // Show answer
              },
            ),
            ListTile(
              title: Text('How to cancel my order?',style: TextStyle(
                  fontSize: 18
              ),),
              onTap: () {
                // Show answer
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: double.infinity,
                child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    "Contact Support",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

}