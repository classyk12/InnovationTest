import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          // physics: ScrollPhysics(),
          children: [
            ListView.builder(
                physics: ScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 10.0, left: 10.0, bottom: 0.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/view-post');
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset('assets/images/video.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Material(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  elevation: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 15, bottom: 20.0),
                                    child: ListTile(
                                      leading: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          child: Image.asset(
                                            'assets/images/loginImage.png',
                                            // height: 200,
                                            // width: 200,
                                          ),
                                        ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text('Johnny peters ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                              ),
                                              Text(' @John_peters',
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 14))
                                            ],
                                          ),
                                          Text(
                                            'Starfish Restaurant, Lekki',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      trailing: Icon(Icons.more_horiz,
                                          color: Colors.black),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ));
                }),
            SizedBox(
                height:
                    10) // or you can wrap the listview in a margin and set bottom margin
          ],
        ));
  }
}
