import 'package:APOD/models/apodModel.dart';
import 'package:flutter/material.dart';

class ApodDetail extends StatelessWidget {
  final Apod model;
  ApodDetail({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("${model.title}"),
        ),
      ),
    );
  }
}
