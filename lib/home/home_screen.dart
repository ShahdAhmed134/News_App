import 'package:flutter/material.dart';
import 'package:news_application/app_color.dart';
import 'package:news_application/home/home_drawer.dart';
import 'package:news_application/home/search/search_tab.dart';
import 'package:news_application/home/setting/setting.dart';
import 'package:news_application/model/category.dart';

import '../l10n/app_localizations.dart';
import 'category/category_details.dart';
import 'category/category_fragment.dart';


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
            title: Text( selectedItem==HomeDrawer.setting?
            AppLocalizations.of(context)!.setting:
                selectedCategory==null?
                AppLocalizations.of(context)!.news:
              selectedCategory!.name,
              style: Theme.of(context).textTheme.titleLarge,),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: IconButton(
                  onPressed: (){
                  showSearch(context: context, delegate: SearchTab());
                }, icon: Icon(Icons.search,
                size: 30,
                ),),
              )
            ],
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
    selectedItem=newItem;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
