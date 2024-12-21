import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/view/category_page/model/photo_model.dart';
import 'package:abu_sahiy/view/category_three/controller/category_three_controller.dart';
import 'package:abu_sahiy/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

class CategoryThreePage extends StatelessWidget {
  const CategoryThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CategoryThreeController>(
            init: CategoryThreeController(),
            builder: (controller) {
              return Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Container(
                    height: 40,
                      width: double.maxFinite,
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoryList.length,
                          itemBuilder: (_, index) {
                            final category = controller.categoryList[index];
                            return InkWell(
                              onTap: () => controller.onCategoryTap(index),
                              child: Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Text(
                                  category.categoryName,
                                  style: index == controller.currentScrollIndex
                                      ? TextStyle(
                                          color: ResColors.primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)
                                      : TextStyle(
                                          color: ResColors.unSelectedText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            );
                          }),
                    ),
                // Expanded(
                //     child:GridView.builder(
                //       controller: controller.scrollController,
                //         physics: BouncingScrollPhysics(),
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 13
                //         ),
                //         scrollDirection: Axis.vertical,
                //         itemCount: controller.photoModelList.length,
                //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           childAspectRatio: 1.5,
                //           mainAxisSpacing: 10,
                //           crossAxisSpacing: 10,
                //
                //         ),
                //         itemBuilder: (BuildContext context, int index){
                //           final photo=controller.photoModelList[index];
                //
                //           controller.pageIndex=photo.index;
                //           return Container(
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(16),
                //                   image: DecorationImage(image: AssetImage('assets/images/${photo.photoPath}'),
                //                       fit: BoxFit.fill
                //                   )
                //               ),
                //               child: Container(
                //                 alignment: Alignment(-0.8, 0.8),
                //                 child:CommonText(text: photo.name,color: ResColors.white, size: 14, fontWeight: FontWeight.w500,) ,
                //               )
                //
                //           );
                //         }) ),
                    //22
                    // Expanded(
                    //   child: GroupedListView<String,List<PhotoModel>>(
                    //     elements: controller.elements[group],
                    //     groupBy: (element) => element['group'],
                    //   itemBuilder: (_,element){
                    //     return Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(16),
                    //             image: DecorationImage(image: AssetImage('assets/images/${element['group']}'),
                    //                 fit: BoxFit.fill
                    //             )
                    //         ),
                    //         child: Container(
                    //           alignment: Alignment(-0.8, 0.8),
                    //           child:CommonText(text: photo.name,color: ResColors.white, size: 14, fontWeight: FontWeight.w500,) ,
                    //         )
                    //
                    //     );
                    //   },
                    //   ),
                    // )
                    Expanded(
                        child: Container(
                          color: Colors.red,
                          child: ListView.builder(
                          itemCount: controller.categoryList.length,
                          controller: controller.scrollController,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, index){
                            final category=controller.categoryList[index];
                            return Container(
                              height: controller.containerHeight,
                                child:GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: category.photo.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.5,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,

                                    ),
                                    itemBuilder: (BuildContext context, int index){
                                      final photo=category.photo[index];
                                      // controller.pageIndex=photo.index;
                                      return Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              image: DecorationImage(image: AssetImage('assets/images/${photo.photoPath}'),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          child: Container(
                                            alignment: Alignment(-0.8, 0.8),
                                            child:CommonText(text: photo.name,color: ResColors.white, size: 14, fontWeight: FontWeight.w500,) ,
                                          )

                                      );
                                    }) );
                                              }),
                        ))
                  ],
                ),
              );
            }));
  }
}
