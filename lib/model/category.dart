import 'package:flutter/material.dart';

import '../app_color.dart';
import '../l10n/app_localizations.dart';

class Category{
  String name;
  String id;
  Color color;
  String image;
  Category({required this.name,required this.image,required this.color , required this.id});


  static List<Category> getCategories(BuildContext context){
    // entertainment     technology
    return [
      Category(name:   AppLocalizations.of(context)!.sports, image: 'assets/sports.png', color: AppColors.redColor, id: 'sports'),
      Category(name:   AppLocalizations.of(context)!.technology, image: 'assets/technology.png', color: AppColors.blueColor, id: 'technology'),
      Category(name:   AppLocalizations.of(context)!.health, image: 'assets/health.png', color: AppColors.binkColor, id: 'health'),
      Category(name:   AppLocalizations.of(context)!.business, image: 'assets/bussines.png', color: AppColors.brownColor, id: 'business'),
      Category(name:   AppLocalizations.of(context)!.general, image: 'assets/environment.png', color: AppColors.cianColor, id: 'general'),
      Category(name:   AppLocalizations.of(context)!.science, image: 'assets/science.png', color: AppColors.yellowColor, id: 'science')
    ];

  }
}