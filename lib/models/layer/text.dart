import 'package:flutter/material.dart';
import 'package:repaint/utils.dart';

import 'layer.dart';

class TextLayer extends RLayer {
  TextLayer({
    this.align,
    this.shadow = const Shadow(),
    required this.style,
    required this.font,
    required this.size,
    required this.offset,
    required this.text,
    required this.layerType
  });

  @override
  String layerType;

  @override
  final Offset offset;

  @override
  final double opacity = 1;

  @override
  final Size size;
  @override
  final Shadow shadow;
  // Used to match google fonts
  final String font;

  // TODO: split style
  final TextStyle style;

  final TextAlign? align;

  final String text;

  @override
  List<Object?> get props => [
        offset,
        opacity,
        text,
        style,
        size,
        align,
        font,
        shadow,
      ];

  TextLayer copyWith({
    Offset? offset,
    TextStyle? style,
    String? text,
    double? opacity,
    Size? size,
    TextAlign? align,
    String? font,
    Shadow? shadow,
    String? layerType
  }) {
    return TextLayer(
      offset: offset ?? this.offset,
      style: style ?? this.style,
      text: text ?? this.text,
      size: size ?? this.size,
      align: align ?? this.align,
      font: font ?? this.font,
      shadow: shadow ?? this.shadow,
        layerType: layerType ?? this.layerType
    );
  }

  @override
  String toString() {
    return '$text';
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["text"] = text;
    data['font'] = font;
    data['textAlign'] =  exportTextAlign(align);
    data['style'] = exportTextStyle(style);

    return data;
  }
}

const availableFonts = <String>[
  'Raleway',
  'Montserrat',
  'Roboto',
  'Playfair Display',
  'Lobster',
  'Oswald',
  'Abril Fatface',
  'Roboto Condensed',
  'Merriweather',
  'Prompt',
  'Permanent Marker'
];
