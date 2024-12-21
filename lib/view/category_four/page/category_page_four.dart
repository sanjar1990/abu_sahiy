import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class CategoryPageFour extends StatefulWidget {
  const CategoryPageFour({super.key});

  @override
  State<CategoryPageFour> createState() => _CategoryPageFourState();
}

class _CategoryPageFourState extends State<CategoryPageFour> with TickerProviderStateMixin  {
  final data = {
    "Category A": [
      "Item 1 (A)",
      "Item 2 (A)",
      "Item 3 (A)",
      "Item 4 (A)",
    ],
    "Category B": [
      "Item 1 (B)",
      "Item 2 (B)",
    ],
    "Category C": [
      "Item 1 (C)",
      "Item 2 (C)",
      "Item 3 (C)",
      "Item 4 (C)",
      "Item 5 (C)",
    ],
    "Category D": [
      "Item 1 (D)",
      "Item 2 (D)",
      "Item 3 (D)",
      "Item 4 (D)",
      "Item 5 (D)",
      "Item 6 (D)",
      "Item 7 (D)",
      "Item 8 (D)",
      "Item 9 (D)",
    ],
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 10, vsync: this);
    ScrollController _controller=ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body:Scaffold(
          body:
          TabBarView(controller: tabController, children: <Widget>[
        ListView.separated(
          controller: _controller,
          separatorBuilder: (context, int index) {
            return Container(
              height: 50,
              color: Colors.cyan,
              child: Center(child: Text(index.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18,),)),
            );
          },
          // shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return
            ScrollableListTabScroller(

              itemCount: data.length,

              tabBuilder: (_, index, active) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(data.keys.elementAt(index),
              style: !active?null:TextStyle(
                fontWeight: FontWeight.bold, color: ResColors.primaryColor
              ),
              ),
              ),
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                      Text(data.keys.elementAt(index),
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20
                      ),),
                    ...data.values.elementAt(index)
                    .asMap()
                    .map((index,value)=>MapEntry(index, ListTile(
                      leading: Container(
                        height: 40,
                          width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey
                        ),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text(value),
                    ),),).values
                  ],
                );
              },
            );
          },
          itemCount: 8,
        ),
      ]),
    ),

    );
  }
}
