

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsContainer extends StatelessWidget{

  const OptionsContainer({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed
}) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(

          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 1
                )
              ]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(icon,color: Colors.blueAccent,size: 35,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}