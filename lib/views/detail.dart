// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Tony Montana",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Container(
                      child: Image.network(
                          "https://randomuser.me/api/portraits/med/men/83.jpg",
                          fit: BoxFit.cover),
                    )),
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.zero,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoCard('Gender', "Male"),
              infoCard('Mobile', "+1-098-0900-909"),
              infoCard('Date of Birth', "26 July, 2002"),
              infoCard('Date Joined', "Jun 21 2021"),
              infoCard('Email', "rudi.droste@example.com"),
              infoCard('Address',
                  "Germany, Sachsen-Anhalt, GrÃ¼nhain-Beierfeld 1196, MÃ¼hlenweg"),
            ],
          ),
        ));
  }

  infoCard(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 6, bottom: 6, right: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
        ),
        Text(subtitle,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 15)),
        SizedBox(height: 5),
        Divider(color: Colors.grey)
      ]),
    );
  }
}
