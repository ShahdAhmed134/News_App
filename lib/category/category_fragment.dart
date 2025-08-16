import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/category/category_item.dart';
import 'package:news_application/model/category.dart';

class CategoryFragment extends StatelessWidget {
var categoryList = Category.getCategories();
Function onClickItem;
CategoryFragment({required this.onClickItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin:  EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \nof interest',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.blackColor
          ),),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10),
            
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: (){
                        onClickItem(categoryList[index]);
                      },
                      child: CategoryItem(category: categoryList[index], index: index));
                },
              itemCount: 6,),
          )
        ],
      ),
    );
  }
}
