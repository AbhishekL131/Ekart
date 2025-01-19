import 'dart:ffi';

import 'package:ekart/checkout_items.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final List cartItems;
  final double totalAmount;

  const CheckoutScreen({
    Key? key,
    required this.cartItems,
    required this.totalAmount,
  }) : super(key: key);


  String discount(double totalAmount) {
    double dis = totalAmount * 15 / 100;
    int discountedAmount = dis.toInt();
    return discountedAmount.toString();
  }


  String delivery(double totalAmount) {
    if (totalAmount < 300) {
      return "Free";
    } else {
      return "25";
    }
  }


  String finalAmount(double totalAmount) {

    double discountedAmount = double.parse(discount(totalAmount));

    double deliveryCharges;
    if (delivery(totalAmount) == "Free") {
      deliveryCharges = 0;
    } else {
      deliveryCharges = double.parse(delivery(totalAmount));
    }


    double finalAmount = totalAmount - discountedAmount + deliveryCharges;



    return finalAmount.toStringAsFixed(2);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return CheckoutItems(
                      image: cartItem['imageUrl'].toString(),
                      title: cartItem['title'].toString(),
                      size: cartItem['size'].toString(),
                      price: cartItem['price'].toString(),
                  );
                },
              ),
            ),

            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.all(15),
              height: 280,
             width: double.infinity,
             decoration: BoxDecoration(
               color: const Color.fromRGBO(245, 247, 249, 1),
               borderRadius: BorderRadius.circular(20)
             ),
             child: Column(
               children: [
                 Text(
                   "Price Details",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 22
                   ),
                 ),
                 SizedBox(height: 20,),
                 Billing(text: "Total amount", amount: "${totalAmount.toStringAsFixed(2)}",color: Colors.black, ),
                 SizedBox(height: 10,),
                 Billing(text: "Discount", amount: "- ${discount(totalAmount) as String}",color: Colors.green),
                 SizedBox(height: 10,),
                 Billing(text: "Delivery Charges", amount: delivery(totalAmount),color: Colors.green),
                 SizedBox(height: 10,),
                 const Divider(),
                 Billing(text: "Total amount", amount: finalAmount(totalAmount),color: Colors.black),
                 SizedBox(height: 5,),
                 const Divider(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text(
                       "You will save ${discount(totalAmount) as String} on this order",
                       style: TextStyle(
                           fontSize: 18,
                           color: Colors.blueAccent
                       ),
                     )
                   ],
                 )


               ],
             ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0,top: 5),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(

                  onPressed: () {
                    // Add your place order functionality here
                  },
                  child: const Text(
                    'Proceed to Buy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Billing extends StatelessWidget{
  final String text;
  final String amount;
  final Color color;
  const Billing({
    Key? key,
    required this.text,
    required this.amount,
    required this.color
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 17
          ),
        ),


        Text(
          amount as String,
          style: TextStyle(
              fontSize: 17,
              color: color
          ),
        )
      ],
    );
  }

}
