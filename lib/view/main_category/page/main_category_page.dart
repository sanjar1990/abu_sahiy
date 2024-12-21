import 'package:abu_sahiy/data/tools/styles/res_colors.dart';
import 'package:abu_sahiy/view/main_category/model/main_category_model.dart';
import 'package:abu_sahiy/view/main_category/repository/main_category_repository.dart';
import 'package:abu_sahiy/view/widgets/common_text.dart';
import 'package:flutter/material.dart';

class MainCategoryPage extends StatefulWidget {
  const MainCategoryPage({super.key});

  @override
  State<MainCategoryPage> createState() => _MainCategoryPageState();
}

class _MainCategoryPageState extends State<MainCategoryPage> {
  final List<GlobalKey> keys = List.generate(
    MainCategoryRepository.categoryMap.length,
        (_) => GlobalKey(),
  );
  Future<void> addKeys()async{
    for(int i=0; i<MainCategoryRepository.categoryMap.length; i++){
      keys.add(GlobalKey());
    }
  }

  late ScrollController scrollController;
  BuildContext? tabContext;
  @override
  void initState() {
    // addKeys();
    print('GLoBAL LENGTH::${keys.length}');
    scrollController=ScrollController();
    scrollController.addListener(animateToTab);

    super.initState();
  }
  void animateToTab()async{

    late RenderBox box;
    for(int i=0; i<keys.length; i++){
      // final currentContext = keys[i].currentContext;
      // if (currentContext == null) continue;
      box=keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position=box.localToGlobal(Offset.zero);
      if(scrollController.offset>=position.dy){
        DefaultTabController.of(tabContext!).animateTo(i,
        duration: Duration(milliseconds: 100,),
        curve: Curves.easeIn);
      }
    }
  }
  Future<void>scrollToIndex(int index)async{

    scrollController.removeListener(animateToTab);
    print('INDEX::$index');
    print('GLOBAL LENGTH::${keys.length}');
    final categories=keys[index].currentContext!;
    print('GLOBALLLL:::${categories.toString()}');
    await Scrollable.ensureVisible(categories,
    duration: Duration(milliseconds: 1000),
    curve: Curves.easeIn);
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<MainCategoryModel>> categoryMap=MainCategoryRepository.categoryMap;

    return DefaultTabController(length: categoryMap.length,
        child: Scaffold(
        appBar: _buildAppBar(),
          body: Builder(builder: (context){
            tabContext=context;

            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: List.generate(categoryMap.keys.length, (index){
                  return Column(
                            children: [
                              _buildCategoryTile(
                                   categoryMap.keys.elementAt(index), index,categoryMap.values.elementAt(index)),
                            ],
                           );
                }),
              ),
            );

          }),
        ));
  }
  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Category"),
      centerTitle: true,
      bottom: TabBar(
        unselectedLabelColor: ResColors.unSelectedText,
        labelStyle: TextStyle(
          color: ResColors.primaryColor
        ),
        indicatorColor: ResColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: MainCategoryRepository.categoryMap.keys.map((e) =>
            Container(
              width: 100,
              child: Tab(
                child: Text(e),
              ),
            )).toList(),
        onTap: (int index)=>scrollToIndex(index),
      ),
    );
  }
  Widget _buildCategoryTile(String title, int index,List<MainCategoryModel> categories){
    return Padding(
      key: keys[index],
      padding: const EdgeInsets.only(top: 14, right: 12, left: 12),
    child: Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Divider(
            thickness: 2,
            indent: 2,
            endIndent: 3,
            color: ResColors.unSelectedText,
          ),
          _buildItemList(categories),
        ],
      ),
    ),
    );
  }
  Widget _buildSingleItem(MainCategoryModel model){
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: AssetImage('assets/images/${model.photoPath}'),
                fit: BoxFit.fill
            )
        ),
        child: Container(
          alignment: Alignment(-0.8, 0.8),
          child:CommonText(text: model.name,color: ResColors.white, size: 14, fontWeight: FontWeight.w500,) ,
        )

    );
  }
  Widget _buildItemList(List<MainCategoryModel> categories){
    return Column(
      children: categories.map((item)=>_buildSingleItem(item)).toList(),
    );
  }
}


