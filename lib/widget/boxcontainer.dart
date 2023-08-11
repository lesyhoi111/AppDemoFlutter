import 'package:flutter/material.dart';

Container boxContainer(
    String name, Alignment alignment, EdgeInsets edgeInsets, TextStyle a,
    [bool isRadiusBox = false]) {
  return Container(
    alignment: alignment,
    height: 150,
    width: 150,
    padding: edgeInsets,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(isRadiusBox ? 100 : 0),
      color: Colors.blue[300],
    ),
    child: Text(
      name,
      style: a,
    ),
  );
}
