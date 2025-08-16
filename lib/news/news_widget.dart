import 'package:flutter/material.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/news/news_item.dart';

import '../app_color.dart';
import '../Api/api_manager.dart';

class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: ApiManager.getNews(widget.source.id!),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text('Something Went Wrong'),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNews(widget.source.id!);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          if(snapshot.data!.status !='ok'){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNews(widget.source.id!);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder:(context , index){
                return NewsItem(article: newsList[index]);

              },
              itemCount: newsList.length,

          );
        });
  }
}
