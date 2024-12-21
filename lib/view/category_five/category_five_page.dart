import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/view/category_five/controller/category_five_controller.dart';
import 'package:abu_sahiy/view/widgets/common_text.dart';
import 'package:anchor_tabs/anchor_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryFivePage extends StatelessWidget {
  const CategoryFivePage({super.key});

  @override
  Widget build(BuildContext context) {

    final tabs=Get.find<CategoryFiveController>().categoryList.map((e)=>Container(child: Text(e.categoryName),)).toList();
    final body=Get.find<CategoryFiveController>().categoryList.map((e){
     return Container(
         child: Column(
       children: [
         Container(
           color: Colors.red,

             child: Text(e.categoryName)),
         const SizedBox(height: 10),
         Container(
height: 600,
           child: GridView.builder(
             padding: const EdgeInsets.symmetric(horizontal: 13),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 1.5,
               mainAxisSpacing: 10,
               crossAxisSpacing: 10,
             ),
             itemCount: e.photo.length,
             itemBuilder: (BuildContext context, int index) {

               final photo = e.photo[index];
               return Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   image: DecorationImage(
                     image: AssetImage('assets/images/${photo.photoPath}'),
                     fit: BoxFit.fill,
                   ),
                 ),
                 child: Container(
                   alignment: const Alignment(-0.8, 0.8),
                   child: CommonText(
                     text: photo.name,
                     color: ResColors.white,
                     size: 14,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
               );
             },
           ),
         ),
       ],
     ));

    }).toList();
    print('BODY LENGTH:::${body.length}');
    print('TAB LENGTH:::${tabs.length}');
    return

      Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: AnchorTabPanel(

            key:UniqueKey(),tabs: tabs, body: body),
      ),
    );
  }
}
