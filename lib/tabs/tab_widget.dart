import 'package:flutter/material.dart';
import 'package:news_application/model/SourceResponse.dart';
import 'package:news_application/Api/api_manager.dart';
import 'package:news_application/news/news_widget.dart';
import 'package:news_application/tabs/tab_item.dart';

import '../app_color.dart';
import '../model/NewsResponse.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourceList;
  
  TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
               isScrollable: true,
                dividerColor: Colors.transparent ,
               indicatorColor: Colors.transparent,
                tabs: widget.sourceList.map((source)=>
                    TabItem(source: source,
                        isSelected: selectedIndex == widget.sourceList.indexOf(source)
                    )
                ).toList()


            ),
            Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
