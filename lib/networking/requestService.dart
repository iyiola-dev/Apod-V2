import 'dart:convert';

import 'package:APOD/models/apodModel.dart';
import 'package:APOD/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApodService {
  Future<List<Apod>> getApod(String startDate, String endDate) async {
    List<Apod> apod;
    try {
      var res = await http.get(
          '$baseUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate');
      if (res.statusCode == 200) {
        List result = jsonDecode(res.body) as List;
        apod = result.map((e) => Apod.fromJson(e)).toList();
      }
      return apod;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }
}
