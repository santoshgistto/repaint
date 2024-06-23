import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RLayer extends Equatable {

  String get layerType;
  Offset get offset;
  double get opacity;
  Size get size;
  Shadow get shadow;

  void set offset(Offset offset){
    this.offset = offset;
  }

  void set layerType(String type){
    this.layerType = type;
  }

  void set size(Size size){
    this.size = size;
  }
  void set shadow(Shadow shadow){
    this.shadow = shadow;
  }
  void set opacity(double value){
    this.opacity = value;
  }


  RLayer copyWith({
    Offset? offset,
    Size? size,
    double? opacity,
    Shadow? shadow,
  });

  fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> offset= json["offset"];
    Map<String, dynamic> size= json["size"];
    Map<String, dynamic> shadow= json["shadow"];
    this.offset = Offset(offset["dx"], offset["dy"]);
    this.opacity = json['opacity'];
    this.size = Size(size ['width'], size['height']);
    this.layerType = json["layerType"];
    //this.shadow = Shadow(color: shadow['color'])
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['opacity'] = opacity;
    data['size'] = {
      "width":size.width,
      "height":size.height
    };
    data['shadow'] = {
       "color": shadow.color.value,
       "offset": {
         "dx":shadow.offset.dx,
         "dy":shadow.offset.dy
       }
    };
    data["layerType"] = this.layerType;

    return data;
  }
}

class IdentityLayer extends Equatable {
  IdentityLayer({
    required this.id,
    required this.data,
  });

  final String id;
  final RLayer data;

  IdentityLayer copyWith({
    String? id,
    RLayer? data,
  }) {
    return IdentityLayer(
      id: id ?? this.id,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "data": data.toJson()};
  }

  @override
  List<Object> get props => [id, data];
}
