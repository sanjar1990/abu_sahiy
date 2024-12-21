import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/view/category_page/widgets/category_text.dart';
import 'package:abu_sahiy/view/category_two/controller/category_two_controller.dart';
import 'package:abu_sahiy/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CategoryTwoPage extends StatelessWidget {
  const CategoryTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryTwoController>(
      init: CategoryTwoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: [
                    ResColors.primaryColor,
                    ResColors.primaryColorOpacity,
                  ],
                ),
              ),
            ),
            leading: Container(
              width: 40,
              height: 40,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                // PageView for categories
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 30.h,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      controller.pageIndex = value;
                      controller.updatePhotoList(); // Update the photo list
                    },
                    controller: controller.pageController,
                    itemCount: controller.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      bool isSelected = controller.pageIndex == index;
                      final category = controller.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.pageController.jumpToPage(index);
                          controller.pageIndex = index;
                          controller.updatePhotoList();
                        },
                        child: Container(
                          child: CategoryText(
                            text: category.categoryName,
                            isSelected: isSelected,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // GridView for photos
                Expanded(
                  child: GridView.builder(
                    controller: controller.scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: controller.photoModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == controller.photoModelList.length - 1 &&
                          !controller.isLoading) {
                        // Scroll down to next category
                        controller.loadNextCategory();
                      } else if (index == 0 && !controller.isLoading) {
                        // Scroll up to previous category
                        controller.loadPreviousCategory();
                      }

                      final photo = controller.photoModelList[index];
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
            ),
          ),
        );
      },
    );
  }
}