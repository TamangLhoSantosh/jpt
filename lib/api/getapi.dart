import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/newsapi.dart';
import '../static.dart';
class GetApi {

  static Future<Newsapi?>? getnewsdata() async {
    try{
      //http request
      // api call
      var url = Uri.https(StaticValue.baseurl, '/v2/everything',
          {"domains":"wsj.com", "apiKey":StaticValue.apikey });
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      Newsapi data = Newsapi.fromJson(jsonResponse);
      return data;
    }
    catch(e){
      //error
      return null;
    }
  }

}