import 'package:curooosellll/webservice.dart';

class Gallerymodel {
  // String id;
  String productid;
  String images;

  Gallerymodel({required this.productid, required this.images});

  factory Gallerymodel.fromJson(Map<String, dynamic> json) {
    // print(
    //   json["id"],
    // );

    print("Link Image :" + Webservice().baseurl + json["image"]);
    return Gallerymodel(
      // id: json["id"],
      productid: json["productid"],
      images: Webservice().baseurl + json["image"],
    );
  }
}
