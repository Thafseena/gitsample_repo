// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curooosellll/common_view_model.dart';
import 'package:curooosellll/detailsmodel.dart';
import 'package:curooosellll/gallerymodel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class details extends StatefulWidget {
  // const details({Key? key}) : super(key: key);
  @override
  _detailsState createState() => _detailsState();
}

@override
void initState() {
  // isLoading = false;
  //  super.initState();

  // print("widget id =" + widget.productid.toString());
}

// ignore: camel_case_types
class _detailsState extends State<details> {
  String? id;

  int _count = 1;
  //String id = "1";

  late CommonViewModel vm;
  late Detailmodel productData;

  late List<Gallerymodel> imageList;

  @override
  Widget build(BuildContext context) {
    print('id> inside details>>>>>>>>>>>>>>+++++++' + id.toString());
    vm = Provider.of<CommonViewModel>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          elevation: 0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: vm.getproductdetail("id"),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  // print("snap____________" + vm.productDetails.toString());

                  productData = vm.productDetails['productData'];
                  imageList = productData.gallery;

                  log("inside log");

                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      {
                        return Column(children: <Widget>[
                          Center(
                            child: CarouselSlider(
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                              ),
                              items: imageList
                                  .map((e) => ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network(
                                              e.images,
                                              width: 1050,
                                              height: 350,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ]);
                      }
                    default:
                      return Center(child: CircularProgressIndicator());
                    //  default:
                    //  return SizedBox();
                  }
                }),
          ),
        ));
  }
}
