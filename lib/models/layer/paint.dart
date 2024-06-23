import 'dart:ui';

import 'package:flutter/rendering.dart' hide Layer;

import 'layer.dart';

class PaintLayer extends RLayer {
  PaintLayer({
    this.clippingPath,
    this.shadow = const Shadow(),
    this.shape = BoxShape.rectangle,
    required this.size,
    required this.offset,
    required this.color,
    required this.radius,
    required this.layerType
  });

  @override
  String layerType;

  @override
  final Offset offset;

  @override
  double get opacity => 1;

  @override
  final Size size;

  final Color color;

  final Path? clippingPath;

  @override
  final Shadow shadow;

  final double radius;

  final BoxShape shape;

  @override
  List<Object?> get props => [
        size,
        offset,
        opacity,
        color,
        clippingPath,
        shadow,
        radius,
        shape,
      ];
  @override
  String toString() => shape == BoxShape.rectangle ? 'Rectangle' : 'Circle';

  PaintLayer copyWith({
    Offset? offset,
    Size? size,
    Color? color,
    Path? clippingPath,
    double? opacity,
    Shadow? shadow,
    double? radius,
    BoxShape? shape,
    String? layerType
  }) {
    return PaintLayer(
      offset: offset ?? this.offset,
      size: size ?? this.size,
      color: color ?? this.color,
      clippingPath: clippingPath ?? this.clippingPath,
      shadow: shadow ?? this.shadow,
      radius: radius ?? this.radius,
      shape: shape ?? this.shape,
        layerType: layerType ?? this.layerType
    );
  }

  @override
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = super.toJson();
    data['color'] = color.value;
    data['boxShape']= shape.name;
    data['radius'] = radius;
    data['clippingPath'] = clippingPath.toString();
    return data;
  }


}
