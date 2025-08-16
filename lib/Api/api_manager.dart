import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/Api/api_constant.dart';

class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=c81b5044792f49908da8073ac4046a19
  static Future<SourceResponse?> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.sourceApi,
    {
      'apiKey': 'c81b5044792f49908da8073ac4046a19',
      'category':categoryId
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


//https://newsapi.org/v2/everything?q=bitcoin&apiKey=c81b5044792f49908da8073ac4046a19

static Future<NewsResponse?> getNews(String sourceId)async{
    Uri url = Uri.https(ApiConstant.baseUrl ,ApiConstant.newsApi,
    {
      'apiKey':'c81b5044792f49908da8073ac4046a19',
      'sources':sourceId
    });
    var response = await http.get(url);
    try{
      var responseBody =response.body;
      var json=jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }


}
}