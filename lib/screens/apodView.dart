import 'package:APOD/models/apodModel.dart';
import 'package:APOD/screens/apodDetail.dart';
import 'package:APOD/utils/widgets/bodyBuilder.dart';
import 'package:flutter/material.dart';

class ApodView extends StatefulWidget {
  final List<Apod> apod;
  ApodView({this.apod});
  @override
  _ApodViewState createState() => _ApodViewState();
}

class _ApodViewState extends State<ApodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: widget.apod.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ApodDetail(model: widget.apod[i])));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: widget.apod[i].url != null
                          ? Image.network("${widget?.apod[i]?.url}")
                          : SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          )),
    );
  }
}
