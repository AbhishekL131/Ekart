
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutItems extends StatelessWidget{
  final String image;
  final String title;
  final String size;
  final String price;


  const CheckoutItems({
    Key? key,
    required this.image,
    required this.title,
    required this.size,
    required this.price
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Material(
        elevation: 3,
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 125,
                      width: 130,
                      child: Image.asset(image),
                    ),

                    Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Size : $size",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Price : $price",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}