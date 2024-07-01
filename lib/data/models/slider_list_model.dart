import 'package:crafty_bay_ecomarc_apps/data/models/slider_data.dart';

class SliderListModel {
  String? msg;
  List<category>? sliderList;

  SliderListModel({this.msg, this.sliderList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <category>[];
      json['data'].forEach((v) {
        sliderList!.add(category.fromJson(v));
      });
    }
  }
}
