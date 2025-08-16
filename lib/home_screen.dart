import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/category/category_details.dart';
import 'package:news_application/category/category_fragment.dart';
import 'package:news_application/home_drawer.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/Api/api_manager.dart';
import 'package:news_application/model/category.dart';
import 'package:news_application/setting.dart';
import 'package:news_application/tabs/tab_widget.dart';

class HomeScreen extends StatefulWidget {
static const String routeName= 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          drawer: Drawer(
            width: MediaQuery.of(context).size.width*0.55,
            child: HomeDrawer(onClickDrawer: onClickDrawer ,)
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News APP',
              style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: selectedItem== HomeDrawer.setting?
              Setting()
          :
          selectedCategory ==null ?
          
          CategoryFragment(onClickItem: onClickItem)
              :
              CategoryDetails(category: selectedCategory!)

        ),
      ],

    );
  }
Category? selectedCategory ;
  onClickItem(Category newCategory) {
    selectedCategory=newCategory;
    setState(() {

    });
  }
int selectedItem=HomeDrawer.categories;
  onClickDrawer(int newItem) {
    selectedCategory=null;
    selectedItem=newItem;
    Navigator.pop(context);
    setState(() {

    });
  }
}
