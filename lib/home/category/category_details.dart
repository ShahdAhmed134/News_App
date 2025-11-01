import 'package:flutter/material.dart';
import 'package:news_application/model/category.dart';
import '../../Api/api_manager.dart';
import '../../app_color.dart';
import '../../l10n/app_localizations.dart';
import '../../model/SourceResponse.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(context,widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
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
                        ApiManager.getSources(context,widget.category.id);
                        setState(() {

                        });
                      },
                      child: Text( AppLocalizations.of(context)!.tryAgain,))
                ],
              ),
            );
          }


          // ✅ لو مفيش بيانات أصلاً
          if (snapshot.data == null || snapshot.data!.sources == null || snapshot.data!.sources!.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.noFoundResult,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          if(snapshot.data!.status != 'ok'){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getSources(context,widget.category.id);
                        setState(() {

                        });
                      },
                      child: Text( AppLocalizations.of(context)!.tryAgain,))
                ],
              ),
            );
          }

          var sourceList = snapshot.data!.sources!;
          return TabWidget(sourceList: sourceList);

        }
    );
  }
}
