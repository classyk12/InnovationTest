// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Row(
          children: [
            Icon(Icons.people),
            SizedBox(width: 20),
            Text('Users'),
          ],
        ),
        backgroundColor: Colors.black,
        floating: true,
        expandedHeight: Get.height * 0.08,
      ),
      SliverList(
          delegate:
              SliverChildBuilderDelegate((context, index) => ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: ScrollPhysics(),
                  itemCount: 200,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed('/details'),
                      child: ListTile(
                          leading: Material(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.black,
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  "https://randomuser.me/api/portraits/med/men/83.jpg",
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            ('Follower 1'),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Follow_follow',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Icon(Icons.chevron_right_outlined)),
                    );
                  })))
    ]));
  }
}
