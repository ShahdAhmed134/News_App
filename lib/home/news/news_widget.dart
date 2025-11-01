import 'package:flutter/material.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:news_application/model/SourceResponse.dart';

import '../../Api/api_manager.dart';
import '../../app_color.dart';
import '../../l10n/app_localizations.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
Source source;

NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<NewsResponse?>(
        future: ApiManager.getNews(context,sourceId: widget.source.id!),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text( AppLocalizations.of(context)!.somethingWentWrong,),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getNews(context,sourceId: widget.source.id!);
                        setState(() {

                        });
                      },
                      child: Text( AppLocalizations.of(context)!.tryAgain,))
                ],
              ),
            );
          }


          // ✅ لو مفيش بيانات أصلاً
          if (snapshot.data == null || snapshot.data!.articles == null || snapshot.data!.articles!.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.noFoundResult,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                        ApiManager.getNews(context,sourceId: widget.source.id!);
                        setState(() {

                        });
                      },
                      child: Text( AppLocalizations.of(context)!.tryAgain,))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder:(context , index){
                return NewsItem(article: newsList[index],);

              },
              itemCount: newsList.length,

          );
        });
  }
}
