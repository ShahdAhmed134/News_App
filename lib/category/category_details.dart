import 'package:flutter/material.dart';
import 'package:news_application/model/category.dart';

import '../app_color.dart';
import '../model/SourceResponse.dart';
import '../Api/api_manager.dart';
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
        future: ApiManager.getSources(widget.category.id),
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
                  Text('Something Went Wrong'),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
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
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
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
