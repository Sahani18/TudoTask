import 'dart:convert';

import 'package:tudotask/Modals/apiresult.dart';
import 'package:tudotask/Modals/modalclass.dart';

import 'package:http/http.dart' as http;
import 'package:tudotask/constants/constant.dart';

abstract class BreakingApi {
  Future<List<BreakingBad>> getBreakingBad();
}

class BreakingBadService extends BreakingApi {
  List<BreakingBad> breakingBad = [];

  @override
  Future<List<BreakingBad>> getBreakingBad() async {
    var response = await http.get(Uri.parse(Link.url));

    var decodedData = jsonDecode(response.body);
    for (var data in decodedData) {
      breakingBad.add(BreakingBad(data['name'], data['birthday'], data['img']));
    }

    // List<BreakingBad> breakingBad =
    //     ApiResultModel.fromJson(decodedData).breakingBad;

    return breakingBad;
  }
}
