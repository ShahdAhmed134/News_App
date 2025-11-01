import 'package:flutter/material.dart';
import 'package:news_application/model/category.dart';

class CategoryItem extends StatelessWidget {
Category category;
int index;
CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
      decoration: BoxDecoration(
          color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(
            index % 2 ==0 ? 0 :20
          ),
          bottomLeft: Radius.circular(
              index%2 ==0 ? 20 : 0
          )
        )
      ),
      child: Column(
        children: [
          Image.asset(category.image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.1,),
         //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Text(category.name,
          style: Theme.of(context).textTheme.titleLarge,)
        ],
      ),
    );
  }
}
