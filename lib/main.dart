import 'package:favourite_food_screen/view/favourite_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(AddToFavourite());
}
class AddToFavourite extends StatelessWidget {
  const AddToFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavouriteScreen(),
    );
  }
}