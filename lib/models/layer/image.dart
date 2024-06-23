import 'dart:typed_data';
import 'dart:ui';

import 'layer.dart';

class ImageLayer extends RLayer {
  ImageLayer({
    //this.imageData,
    this.imageUrl,
    required this.size,
    required this.offset ,
    required this.layerType,
    this.radius = 0,
    this.shadow = const Shadow(),
  });

  @override
  String layerType;

  @override
   Offset offset;

  @override
   double opacity = 1;

   //Uint8List? imageData;

   String? imageUrl = "";

  @override
   Size size;

  @override
   Shadow shadow;

   double radius;

  @override
  List<Object?> get props => [offset, opacity, size, shadow, radius];

  ImageLayer copyWith({
    Offset? offset,
    Size? size,
    double? opacity,
    Shadow? shadow,
    double? radius,
    String? layerType,
    String? imageUrl
  }) {
    return ImageLayer(
      offset: offset ?? this.offset,
      size: size ?? this.size,
      shadow: shadow ?? this.shadow,
      radius: radius ?? this.radius,
      layerType: layerType ?? this.layerType,
        imageUrl:imageUrl ?? this.imageUrl
    );
  }


  @override
  String toString() {
    return 'Image';
  }

  @override
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = super.toJson();
    data["radius"] = radius;
    data["imageUrl"] = imageUrl;

    return data;
  }


  ImageLayer  fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> offset= json["offset"];
    Map<String, dynamic> size= json["size"];
    Map<String, dynamic> shadow= json["shadow"];

    var offset1 = Offset(offset["dx"], offset["dy"]);
  //  this.opacity = json['opacity'];
    var sizes = Size(size ['width'], size['height']);
    // this.data = json['data'];
    // this.imageUrl = json['imageUrl'];
    // this.radius = json['radius'];

    return ImageLayer(size: sizes, offset: offset1, layerType:  "");
  }


}
