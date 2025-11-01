import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/home/news/news_item.dart';
import 'package:news_application/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';

class NewsDetails extends StatelessWidget {

static const String routeName='details';

  @override
  Widget build(BuildContext context) {

    var article=ModalRoute.of(context)!.settings.arguments as Articles;
    return Stack(
      children: [
      Container(
      color: AppColors.whiteColor,
      child: Image.asset('assets/background.png',
        width: double.infinity,
        height: double.infinity,
        fit:BoxFit.cover,
      ),
    ),
        Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            title: Text(article.source!.name!,
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: Column(

            children: [
              NewsItem(article: article,),
            Container(
              color: AppColors.whiteColor,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              child: Column(

                children: [
                  Text(article.content??""),
                  InkWell(
                     onTap: (){
                       _launchUrl(article.url??'');
                     },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text( AppLocalizations.of(context)!.viewArticle,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleMedium,),
                         Icon(Icons.play_arrow)
                       ],
                     ),
                   ),

                ],
              ),
            )

            ],
          ),
        )
    ]
    );
  }
Future<void> _launchUrl(String url) async {
    Uri uri=Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
}
