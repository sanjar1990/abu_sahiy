  import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
  import 'package:abu_sahiy/view/category_six/controller/category_six_controller.dart';
  import 'package:abu_sahiy/view/category_six/widgets/models.dart';
  import 'package:abu_sahiy/view/category_six/widgets/scroll_to_animate_tab.dart';

  import 'package:abu_sahiy/view/widgets/common_text.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get_state_manager/src/simple/get_state.dart';

  class CategorySix extends StatefulWidget {
    const CategorySix({super.key});

    @override
    State<CategorySix> createState() => _CategorySixState();
  }

  class _CategorySixState extends State<CategorySix> {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<CategorySixController>(
          init: CategorySixController(),
          builder: (controller) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ScrollToAnimateTab(
                      tabAnimationCurve: Curves.linear,
                      tabAnimationDuration: Duration(milliseconds: 200),
                      tabHeight: 70,
                      activeTabDecoration: TabDecoration(
                        textStyle: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(5),
                        //   ),
                        // ),
                      ),
                      inActiveTabDecoration: TabDecoration(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black12),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(5),
                        //   ),
                        // ),
                      ),
                      tabs: controller.categoryList
                          .map(
                            (e) => ScrollableList(
                              label: e.categoryName,
                              body: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        image: AssetImage(
                                            'assets/images/${photo.photoPath}'),
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
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          });
    }
  }
