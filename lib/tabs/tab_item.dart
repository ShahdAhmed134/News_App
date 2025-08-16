import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected ;
  TabItem({
    required this.source,
    required this.isSelected
});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: AppColors.primaryColor,
            width: 2
        ),
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
      ),
      child: Text(source.name??'',
      style: TextStyle(
        color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
        fontSize: 15,
fontWeight: FontWeight.w600
      ),),
    );
  }
}
