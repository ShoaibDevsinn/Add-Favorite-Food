import 'dart:html';

import 'package:flutter/material.dart';
import 'package:favourite_food_screen/components/preference.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  void initState() {
    getitem();
    super.initState();
  }

  var itemlist;
  getitem() async {
    var data = await Perfrences.getitem();
    if (data != null) {
      itemlist = data;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
          title: Center(
            child: Text(
              "Favourites",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        body: itemlist == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.only( right: 15, left: 15),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: itemlist.length,
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
                                      image: AssetImage(itemlist[index]["pizza"]),
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
                                    itemlist[index]["text"],
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
                                    height: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    itemlist[index]["price"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ))
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Perfrences.sveitem(itemlist[index]);
                                getitem();
                              },
                              icon: Icon(Icons.favorite,
                                  size: 27, color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
      ),
    );
  }
}
