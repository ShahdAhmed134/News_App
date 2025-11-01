import 'package:flutter/material.dart';

import '../../Api/api_manager.dart';
import '../../app_color.dart';
import '../../l10n/app_localizations.dart';
import '../../model/NewsResponse.dart';
import '../news/news_item.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
   Padding(
       padding: const EdgeInsets.only(top: 8.0),
    child:IconButton(
       onPressed: (){
         return showResults(context);
       }, icon: Icon(Icons.search,
       size: 30,
     ),),

   )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(
       onPressed: (){
         Navigator.of(context).pop();
       },
       icon: Icon(Icons.close)
   );
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      return getSearch(context);
    }else {
      return Center(child: Text( AppLocalizations.of(context)!.noFoundResult,));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      return getSearch(context);
    }else {
      return  Stack(
        children: [
        Container(
        color: AppColors.whiteColor,
        child: Image.asset(
          'assets/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    Center(child: Text( AppLocalizations.of(context)!.noSuggestion,)
    )
    ,
    ],);
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.whiteColor
      ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white, // لون النص اللي بيتكتب
            fontSize: 18,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: InputBorder.none
        ),
        appBarTheme: AppBarTheme(
            iconTheme:IconThemeData(
              color: AppColors.whiteColor,
            ),
            centerTitle: true,
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                )
            ),

        )
    );

  }

 Widget getSearch(BuildContext context){
   return Stack(
     children: [
     // الخلفية
     Container(
     color: AppColors.whiteColor,
     child: Image.asset(
       'assets/background.png',
       width: double.infinity,
       height: double.infinity,
       fit: BoxFit.cover,
     ),
   ),
     FutureBuilder<NewsResponse?>(
       future: ApiManager.getNews(context,search: query),
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
                       ApiManager.getNews(context,search: query);
                     },
                     child: Text( AppLocalizations.of(context)!.tryAgain,),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: AppColors.primaryColor,   // لون الخلفية
                     foregroundColor: AppColors.whiteColor,   // لون النص أو الأيقونة
                   ),)
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
                       ApiManager.getNews(context,search: query);
                     },
                     child: Text( AppLocalizations.of(context)!.tryAgain,),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: AppColors.primaryColor,   // لون الخلفية
                     foregroundColor: AppColors.whiteColor,   // لون النص أو الأيقونة
                   ),

                 )
               ],
             ),
           );
         }
         var newsList = snapshot.data!.articles!;
         if(newsList==null||newsList.isEmpty){
           return Center(child: Text( AppLocalizations.of(context)!.noFoundResult,));
         }
         return ListView.builder(
           itemBuilder:(context , index){
             return NewsItem(article: newsList[index]);

           },
           itemCount: newsList.length,

         );
       },
     ),
     ],
   );
 }

}