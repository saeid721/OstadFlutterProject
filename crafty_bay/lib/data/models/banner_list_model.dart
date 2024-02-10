import 'package:crafty_bay/data/models/banner_list.dart';

class ProductListModel {
  String? msg;
  List<BannerItem>? bannerList;

  ProductListModel({this.msg, this.bannerList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <BannerItem>[];
      json['data'].forEach((v) {
        bannerList!.add(BannerItem.fromJson(v));
      });
    }
  }

  get categoryList => null;

  get productList => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (bannerList != null) {
      data['data'] = bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
