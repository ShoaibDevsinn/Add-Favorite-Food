import 'dart:developer';
import 'package:favourite_food_screen/components/categories/category_data.dart';
import 'package:favourite_food_screen/components/categories/custom_Categories.dart';
import 'package:favourite_food_screen/components/item_list/item_data.dart';
import 'package:favourite_food_screen/components/preference.dart';
import 'package:favourite_food_screen/view/my_favourite.dart';

import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({context, index});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var itemlist;
  getitem() async {
    var data = await Perfrences.getitem();
    if (data != null) {
      itemlist = data;
      setState(() {});
    }
  }

  bool checkfav(text) {
    // debugger();
    var check = false;
    if (itemlist != null) {
      for (var index = 0; index < itemlist.length; index++) {
        // debugger();
        if (itemlist[index]["text"] == text) {
          check = true;
          break;
        }
      }
    }
    print(check);

    // debugger();
    return check;
  }

  @override
  void initState() {
    getitem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        bottomNavigationBar: Container(
          height: 57,
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                Icons.home_outlined,
                size: 33,
                color: Colors.grey[600],
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyFavourite()));
                },
                icon: Icon(Icons.favorite, size: 31, color: Colors.grey[600]),
              )),
              Expanded(
                  child: Icon(Icons.calendar_today_outlined,
                      size: 27, color: Colors.grey[600])),
              Expanded(
                  child: Icon(Icons.shopping_cart_outlined,
                      size: 31, color: Colors.grey[600])),
              Expanded(
                  child: Icon(Icons.account_circle_outlined,
                      size: 31, color: Colors.grey[600]))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 7, right: 15, left: 15),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.location_on_outlined,
                    size: 23,
                  ),
                  title: Text(
                    "Pakistan",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                  trailing: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              focusColor: Colors.black,
                              prefixIcon: Icon(Icons.search, size: 29),
                              hintText: "Search meal...",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 21)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 63,
                      width: 63,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: Center(
                          child: Icon(
                        Icons.menu,
                        size: 30,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Images/salad.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Colors.black12,
                            offset: Offset(0, 5))
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    )),
                    Text(
                      "View more",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 190,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categorydata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCategories(
                          text: categorydata[index]["text"],
                          image: categorydata[index]["image"],
                        );
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Item List",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: Itemdata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: 23,
                        ),
                        height: 110,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 205, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  color: Colors.black12,
                                  offset: Offset(0, 5))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 110,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Itemdata[index]["pizza"]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Itemdata[index]["text"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Expanded(
                                        child: Text(
                                      "A pizza is make by fresh ingredient",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Expanded(
                                        child: Text(
                                      Itemdata[index]["price"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ))
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Perfrences.sveitem(Itemdata[index]);
                                  getitem();
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 27,
                                  color: checkfav(Itemdata[index]["text"])
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
