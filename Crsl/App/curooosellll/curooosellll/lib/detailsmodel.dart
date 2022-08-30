import 'package:curooosellll/gallerymodel.dart';

class Detailmodel {
  String id;
  String shopid;
  String category;
  String product;
  String purchaseprice;
  String salesprice;
  String isoffer;
  String images;
  String productid;
  String description;
  List<Gallerymodel> gallery;
  // List<Gallerymodel> productid;

  Detailmodel({
    required this.id,
    required this.shopid,
    required this.category,
    required this.product,
    required this.purchaseprice,
    required this.salesprice,
    required this.isoffer,
    required this.images,
    required this.productid,
    required this.description,
    required this.gallery,
  });
  // required this.productid});

  factory Detailmodel.fromJson(Map<String, dynamic> json) {
    List<Gallerymodel> gallery;
    //print("+++++products" + json['products'].toString());
    if (json['gallery'] != null) {
      var objGallery = json['gallery'] as List;
      gallery = objGallery
          .map((featureJson) => Gallerymodel.fromJson(featureJson))
          .toList();
      print(">>>>gallery " + gallery.toString());
    }

    return Detailmodel(
      id: json["id"],
      shopid: json["shopid"],
      category: json["category"],
      product: json["product"],
      purchaseprice: json["purchaseprice"],
      salesprice: json["salesprice"],
      isoffer: json["isoffer"],
      images: json["images"],
      description: json["description"],
      gallery: json["gallery"], productid: json["productid"],
      // productid: json["productid"],
    );
  }
}
