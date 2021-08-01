// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intelligent_innovation/controllers/detail-controller.dart';
import 'package:intelligent_innovation/controllers/home-controller.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:get/get.dart';
import 'package:intelligent_innovation/utils/error.dart';
import 'package:intelligent_innovation/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatelessWidget {
  final UserDetailModel? model;

  DetailScreen({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailController _detailController = Get.put(DetailController());
    _detailController.detail.value.id = model?.id;
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
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: model!.picture!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator.adaptive(),
                        errorWidget: (context, url, error) => Icon(
                            Icons.no_photography_outlined,
                            color: Colors.grey),
                      ),
                    )),
              ),
            ];
          },
          body: Obx(() {
            if (_detailController.progress.value == LoadingEnum.loading) {
              return Center(
                  child: CircularProgressIndicator.adaptive(strokeWidth: 1));
            }

            if (_detailController.progress.value == LoadingEnum.done) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  infoCard(
                      'Gender', _detailController.detail.value?.gender ?? ''),
                  infoCard(
                      'Mobile', _detailController.detail.value?.phone ?? ''),
                  infoCard(
                      'Date of Birth',
                      getStringDate(
                          _detailController.detail.value.dateOfBirth!)),
                  infoCard(
                      'Date Joined',
                      getStringDate(
                          _detailController.detail.value.registerDate!)),
                  infoCard('Email', model!.email!),
                  infoCard(
                      'Address',
                      formatLocation(_detailController.detail.value?.location ??
                          new Location())),
                ],
              );
            }

            return HandleError(
                _detailController.error.value, _detailController.getUserDetail);
          }),
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
