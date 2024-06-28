import 'package:favourite_food_screen/components/categories/category_data.dart';
import 'package:flutter/material.dart';

class CustomCategories extends StatelessWidget {
  var  text, image;
 CustomCategories({required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 150,
      width: 170,
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                color: Colors.black12,
                offset: Offset(0, 5))
          ]),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.white, fontSize: 23),
      )),
    );
  }
}
