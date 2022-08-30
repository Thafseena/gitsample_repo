import 'package:curooosellll/detailsmodel.dart';
import 'package:curooosellll/gallerymodel.dart';

class DetailViewModel {
  final Detailmodel detail;

  DetailViewModel(this.detail);

  String get id {
    return detail.id;
  }

  String get shopid {
    return detail.shopid;
  }

  String get category {
    return detail.category;
  }

  String get product {
    return detail.product;
  }

  String get purchaseprice {
    return detail.purchaseprice;
  }

  String get salesprice {
    return detail.salesprice;
  }

  String get isoffer {
    return detail.isoffer;
  }

  String get images {
    return detail.images;
  }

  String get description {
    return detail.description;
  }

  List<Gallerymodel> gallery() {
    return detail.gallery;
  }
  //  List<Gallerymodel> gallery() {
  //   return detail.productid;

  // }
}
