import 'package:flutter/material.dart';

import '../app_color.dart';
import '../l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1 ;
  static const int setting = 2 ;
  Function onClickDrawer;
  HomeDrawer({required this.onClickDrawer});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          color: AppColors.primaryColor,
          child: Center(
            child: Text(  AppLocalizations.of(context)!.news,
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.18,
        ),
        InkWell(
          onTap: (){
            onClickDrawer(categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.02,
                ),
                Text(  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.labelLarge,)

              ],
            ),
          ),
        ),

        InkWell(
          onTap: (){
            onClickDrawer(setting);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.02,
                ),
                Text(  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
