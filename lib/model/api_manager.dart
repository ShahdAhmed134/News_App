import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/model/api_constant.dart';

class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=c81b5044792f49908da8073ac4046a19
  static Future<SourceResponse?> getSources()async{
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.nameApi,
    {
      'apiKey': 'c81b5044792f49908da8073ac4046a19'
    });
   var response = await http.get(url);
   try{
     var responseBody = response.body;
     var json = jsonDecode(responseBody);
     return SourceResponse.fromJson(json);
     /// SourceResponse.fromJson(jsonDecode(body));
   }catch(e){
     throw e;
   }

}
}