import 'package:flutter/material.dart';

import '../app_color.dart';

class Category{
  String name;
  String id;
  Color color;
  String image;
  Category({required this.name,required this.image,required this.color , required this.id});


  static List<Category> getCategories(){
    // entertainment     technology
    return [
      Category(name: 'Sports', image: 'assets/sports.png', color: AppColors.redColor, id: 'sports'),
      Category(name: 'Technology', image: 'assets/technology.png', color: AppColors.blueColor, id: 'technology'),
      Category(name: 'Health', image: 'assets/health.png', color: AppColors.binkColor, id: 'health'),
      Category(name: 'Business', image: 'assets/bussines.png', color: AppColors.brownColor, id: 'business'),
      Category(name: 'general', image: 'assets/environment.png', color: AppColors.cianColor, id: 'general'),
      Category(name: 'science', image: 'assets/science.png', color: AppColors.yellowColor, id: 'science')
    ];

  }
}