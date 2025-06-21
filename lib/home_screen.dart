import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/model/api_manager.dart';
import 'package:news_application/tabs/tab_widget.dart';

class HomeScreen extends StatelessWidget {
static const String routeName= 'Home';

  @override
  Widget build(BuildContext context) {
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
            title: Text('News APP',
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                else if(snapshot.hasError){
                  return Column(
                    children: [
                      Text('Something Went Wrong'),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text('Try Again'))
                    ],
                  );
                }
                if(snapshot.data!.status != 'ok'){
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(
                          onPressed: (){},
                          child: Text('Try Again'))
                    ],
                  );
                }

                var sourceList = snapshot.data!.sources!;
                return TabWidget(sourceList: sourceList);

              }
              ),

        ),
      ],

    );
  }
}
