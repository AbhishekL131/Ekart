


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       color: backgroundColor,
       borderRadius: BorderRadius.circular(20)
     ),
     margin: const EdgeInsets.all(20),
     padding: const EdgeInsets.all(16.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           title,
           style: Theme.of(context).textTheme.titleMedium,
         ),
         SizedBox(
           height: 5,
         ),
         Text(
           '\$$price',
             style: Theme.of(context).textTheme.bodySmall
         ),
         SizedBox(
           height: 5,
         ),
         Center(
           child: Image(
             height: 175,
               image: AssetImage(image)
           ),
         ),


       ],
     ),
   );
  }

}