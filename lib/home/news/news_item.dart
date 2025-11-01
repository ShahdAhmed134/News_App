import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/home/news/news_details.dart';
import 'package:news_application/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
Articles article;
NewsItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetails.routeName,arguments: article);
      },
      child: Container(
        color: AppColors.whiteColor,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: article.urlToImage??'',
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.25,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator( color: AppColors.primaryColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Text(article.author??"",
            style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Text(article.title??"",
              style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(
              height:  MediaQuery.of(context).size.height*0.01,
            ),
            Text(
                DateFormat('dd/MM/yyyy').format(
                    DateTime.parse(article.publishedAt!)
                ),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign:TextAlign.end,
            )


          ],
        ),
      ),
    );
  }
}

