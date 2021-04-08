import 'package:APOD/models/apodModel.dart';
import 'package:APOD/networking/apiRequestStatus.dart';
import 'package:APOD/networking/requestService.dart';
import 'package:APOD/screens/apodView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApodProvider extends ChangeNotifier {
  ApiRequestStatus status = ApiRequestStatus.uninitialized;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateFormat formatter = new DateFormat('yyyy-MM-dd');
  ApodService service = ApodService();
  String error = '';
  Future<void> getApod(BuildContext context) async {
    String formattedStartDate = formatter.format(startDate);
    String formattedEndDate = formatter.format(endDate);
    try {
      status = ApiRequestStatus.loading;
      notifyListeners();
      List<Apod> model =
          await service.getApod(formattedStartDate, formattedEndDate);
      status = ApiRequestStatus.loaded;
      notifyListeners();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApodView(
                    apod: model,
                  )));
    } catch (e) {
      status = ApiRequestStatus.error;
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> getStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(1995, 6, 16),
        lastDate: startDate);
    if (picked != null && picked != startDate) {
      startDate = picked;
      notifyListeners();
    } else {
      SnackBar(
          content:
              Text("picked date can neither empty nor same with today's date"));
    }
  }

  Future<void> getEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(1995, 6, 16),
        lastDate: endDate);
    if (picked != null && picked != endDate) {
      endDate = picked;
      notifyListeners();
    } else {
      SnackBar(
          content:
              Text("picked date can neither empty nor same with today's date"));
    }
  }
}
