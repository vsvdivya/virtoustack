import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http ;
import 'package:virtoustack_app/Model/Category.dart';
import 'package:virtoustack_app/Model/SuperResponce.dart';
import 'package:virtoustack_app/utils/Internet_connection.dart';

class GetCategoryListRepo {

  static Future<SuperResponse<List<Category>>> getCatgories() async {
    // userDetails = await SessionManager.getUser();
    // selectedCity = await SessionManager.getSelectedCity();

    var body = {
    };
    var isInternetConnected = await InternetUtil.isInternetConnected();
    if (isInternetConnected) {
      print('Internet Available');

      return http
          .post("https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths",
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: json.encode(body))
          .then((http.Response response) {
        if (response.statusCode < 200 ||
            response.statusCode > 400 ||
            json == null) {
          throw new Exception("Error while fetching data");
        }
        Map<String, dynamic> map = json.decode(response.body);

        print(response.body);
        Iterable data = map['data'] as List;
        print('@@@${data}');
        List<Category> cat_ist = data.map((dynamic ts) => Category.fromJson(ts)).toList();

        var superResponse = SuperResponse.fromJson(map, cat_ist);
        print(cat_ist);
        return superResponse;

      });
    }
  }
}