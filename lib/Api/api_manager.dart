import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/Api/api_constant.dart';
import 'package:provider/provider.dart';

import '../app_config_provider.dart';

class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=c81b5044792f49908da8073ac4046a19
  static Future<SourceResponse?> getSources(context,String categoryId)async{
    var provider = Provider.of<AppConfigProvider>(context, listen: false);
    String lang = provider.language;

    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.sourceApi,
    {
      'apiKey': 'a9fb2fd117f6416483aa8f130265e26c',
      'category':categoryId,
      'language': lang,
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

static Future<NewsResponse?> getNews(context,{String? sourceId, String? search})async{
  var provider = Provider.of<AppConfigProvider>(context, listen: false);
  String lang = provider.language;

  Uri url = Uri.https(ApiConstant.baseUrl ,ApiConstant.newsApi,
    {
      'apiKey':'a9fb2fd117f6416483aa8f130265e26c',
      'sources':sourceId,
      'q':search,
      'language': lang,
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