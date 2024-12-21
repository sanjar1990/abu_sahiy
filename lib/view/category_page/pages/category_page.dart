import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/view/category_page/controller/category_controller.dart';
import 'package:abu_sahiy/view/category_page/widgets/category_text.dart';
import 'package:abu_sahiy/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller){
          return Scaffold(
      appBar:AppBar(
        flexibleSpace:Container(
          width: 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: [ResColors.primaryColor,ResColors.primaryColorOpacity])
          ),
        ) ,
        leading: Container(
          width: 40,
          height: 40,
          // child: Image.asset(name),
        ),
      ),
            body: Container(
              margin: EdgeInsets.only(
                top: 16
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20
                    ),
                    height: 30.h,
                    child: PageView.builder(
                      onPageChanged: (value){
                        // controller.photoModelList=controller.categoryList[value].photo;
            controller.pageIndex=value;
            controller.update();
                      },
        controller: controller.pageController,
                      itemCount: controller.categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){
                        bool isSelected=controller.pageIndex==index;
                      final category=controller.categoryList[index];
                      return GestureDetector(
                        onTap: (){
                          controller.pageIndex=index;
                          controller.update();
                        },
                        child: Container(
                          child: CategoryText(text: category.categoryName, isSelected: isSelected,),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                      child:GridView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 13
                        ),
                        scrollDirection: Axis.vertical,
                          itemCount: controller.photoModelList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,

                          ),
                          itemBuilder: (BuildContext context, int index){
                            final photo=controller.photoModelList[index];
                            print('LIST INDEX::::$index');

                            print('PHOTO NAME:::${photo.name}');
                              print('PHOTO INDEX:::${photo.index}');
                              print('PAGE INDEX:::${controller.pageIndex}');
                              controller.pageIndex=photo.index;

                              controller.pageController.animateToPage(
                                controller.pageIndex,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut, // Smooth scroll animation
                              );




                            // if(index==controller.photoModelList.length-2){
                            // print('TENGG::');
                            // if(controller.pageIndex>=0){
                            //   controller.pageIndex++;
                            //   controller.pageController.page!=controller.pageIndex;
                            //   controller.photoModelList.addAll(controller.categoryList[controller.pageIndex].photo);
                            // }else{
                            //   controller.pageIndex--;
                            //   controller.pageController.page!=controller.pageIndex;
                            // }
                            // if(controller.pageIndex<controller.categoryList.length){
                            //   controller.pageIndex++;
                            //   controller.pageController.page!=controller.pageIndex;
                            //   controller.photoModelList.addAll(controller.categoryList[controller.pageIndex].photo);
                            //   controller.pageIndex++;
                            //   controller.pageController.page!=controller.pageIndex;
                            // }


                          // }

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
                          }) ),
                ],
              ),
            ),
          );
        });
  }
}
