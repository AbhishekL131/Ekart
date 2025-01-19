


import 'package:ekart/cart_provider.dart';
import 'package:ekart/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget{
  final Map<String , Object> product;



 const ProductDetailsPage({
   super.key,
   required this.product
});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int selectedSize = 0;

  bool isExpanded = false;

  void onTap(){
    if(selectedSize != 0 ){
      Provider.of<CartProvider>(context,listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );


    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select size ")));
     }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
            "Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product['title'] as String,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(image: AssetImage(widget.product['imageUrl'] as String)),
          ),
          const Spacer(flex: 2,),

          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245,247,249,1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              children: [
                Text("\$${widget.product['price']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection:  Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index) {
                        final size = (widget.product['sizes'] as List<int>)[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(

                                label: Text(
                                    size.toString(),
                                  style: TextStyle(
                                    color: selectedSize == size? Colors.white : Colors.black,
                                  ),
                                ),
                              backgroundColor: selectedSize == size? Colors.blueAccent : Colors.white,

                            ),
                          ),
                        );

                    },



                  ),
                ),

                SizedBox(height: 10,),


                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: (){

                      setState(() {
                        isExpanded = !isExpanded;
                      });

                      if(isExpanded){
                        onTap();
                      }

                    },
                    child: AnimatedContainer(
                      width:double.infinity,
                      height: 50,
                        decoration: BoxDecoration(
                          color: isExpanded ? Colors.green : Colors.blueAccent,
                          borderRadius: BorderRadius.circular(40)
                        ),
                        duration: Duration(milliseconds: 500),
                      child: Center(
                        child: Text(
                          isExpanded ? "Added to Cart" : "Add to Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),

                    ),
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}