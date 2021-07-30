// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intelligent_innovation/controllers/detail-controller.dart';
import 'package:intelligent_innovation/controllers/home-controller.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:get/get.dart';
import 'package:intelligent_innovation/utils/utils.dart';

class DetailScreen extends StatelessWidget {
  final UserDetailModel? model;

  DetailScreen({Key? key, this.model}) : super(key: key);
  final DetailController _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    print(model);
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
                    title: Text('${model!.firstName!} ${model!.lastName!} ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Container(
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/me.jpg',
                          image: model!.picture!,
                          fit: BoxFit.cover),
                    )),
              ),
            ];
          },
          body: Obx(() => ListView(
                padding: EdgeInsets.zero,
                children: [
                  _detailController.progress.value == LoadingEnum.failed
                      ? Text('failed to load')
                      : infoCard(
                          'Gender', _detailController.detail.value!.gender!),
                  infoCard('Mobile', model!.email!),
                  _detailController.progress.value == LoadingEnum.failed
                      ? Text('failed to load')
                      : infoCard(
                          'Date of Birth',
                          _detailController.detail.value!.dateOfBirth!
                              .toString()),
                  _detailController.progress.value == LoadingEnum.failed
                      ? Text('failed to load')
                      : infoCard(
                          'Date Joined',
                          _detailController.detail.value!.registerDate!
                              .toString()),
                  infoCard('Email', model!.email!),
                  _detailController.progress.value == LoadingEnum.failed
                      ? Text('failed to load')
                      : infoCard(
                          'Address',
                          formatLocation(
                              _detailController.detail.value!.location!)),
                ],
              )),
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
        _detailController.progress.value == LoadingEnum.loading
            ? CircularProgressIndicator(color: black)
            : Text(subtitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15)),
        SizedBox(height: 5),
        Divider(color: Colors.grey)
      ]),
    );
  }
}
