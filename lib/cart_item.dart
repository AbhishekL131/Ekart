

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget{
  final String image;
  final String title;
  final VoidCallback onPressed;
  final String size;
  final String price;


  const CartItem({
    Key? key,
    required this.image,
    required this.title,
    required this.size,
    required this.onPressed,
    required this.price
}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          color: Colors.white,
          elevation: 3,
          child: Container(
            height: 180,
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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey,
                              width: 0.5
                            )
                          )
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.save,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Text(
                                "Save for later",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),

                      ),
                      InkWell(
                        onTap: onPressed,
                        child: Container(
                          width: 200,
                          height: 40,
                           decoration: BoxDecoration(
                               color: Colors.white,
                             border: Border(
                               top: BorderSide(
                                 color: Colors.grey,
                                 width: 0.5
                               ),
                               left: BorderSide(
                                 color: Colors.grey,
                                 width: 0.5
                               )
                             )
                           ),

                          child: Padding(
                            padding: const EdgeInsets.only(left:40.0,right: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                Text(
                                  "Remove",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                )
                              ],
                            ),
                          )

                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }

}