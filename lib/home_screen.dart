import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';

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

        ),
      ],

    );
  }
}
