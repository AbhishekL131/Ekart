

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayAddress extends StatelessWidget{
  final String name;
  final String phonenumber;
  final String pincode;
  final String state;
  final String city;
  final String housedetails;
  final String area;

  const DisplayAddress({
    Key? key,
    required this.name,
    required this.phonenumber,
    required this.pincode,
    required this.state,
    required this.city,
    required this.housedetails,
    required this.area
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body:  Container(
        height: 200,
        width: double.infinity,
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 21
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Text(
                    "$housedetails ,",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    "$area ,",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),

              Row(
                children: [
                  Text(
                    "$city ,",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    "$state -",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    " $pincode",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  )
                ],
              ),

              SizedBox(height: 20,),

              Row(
                children: [
                  Text(
                    phonenumber,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}