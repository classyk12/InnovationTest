// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intelligent_innovation/controllers/home-controller.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/utils/error.dart';
import 'package:intelligent_innovation/utils/utils.dart';
import 'package:intelligent_innovation/views/detail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          title: Text('Users'),
        ),
        body: Obx(() {
          if (_homeController.progress.value == LoadingEnum.loading) {
            return Center(child: CircularProgressIndicator(color: black));
          }
          if (_homeController.progress.value == LoadingEnum.done) {
            return ListView.builder(
                padding: EdgeInsets.zero,
                physics: ScrollPhysics(),
                itemCount: _homeController.users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.to(DetailScreen(
                        model: new UserDetailModel(
                      id: _homeController.users[index].id!,
                      firstName: _homeController.users[index].firstName!,
                      lastName: _homeController.users[index].lastName!,
                      picture: _homeController.users[index].picture!,
                      email: _homeController.users[index].email!,
                    ))),
                    child: ListTile(
                        leading: Material(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.black,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: _homeController.users[index].picture!,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator.adaptive(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error, color: Colors.red),
                              ),
                              // FadeInImage.assetNetwork(
                              //     placeholder: 'assets/images/me.jpg',
                              //     image: _homeController.users[index].picture!),
                            ),
                          ),
                        ),
                        title: Text(
                          (_homeController.users[index].firstName!),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          _homeController.users[index].lastName!,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right_outlined)),
                  );
                });
          }
          return HandleError(
              _homeController.error.value, _homeController.getData);
        }));
  }
}
