import 'package:abu_sahiy/view/jewelery/models/jewellerys.dart';
import 'package:abu_sahiy/view/jewelery/repository/jewellery_repository.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  final List<GlobalKey>keys=[
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  late ScrollController scrollController;

  BuildContext? tabContext;
  @override
  void initState() {
    scrollController=ScrollController();
    scrollController.addListener(animateToTab);
    super.initState();
  }
 void animateToTab(){
    late RenderBox box;
    for(int i=0; i<keys.length; i++){
      box=keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position= box.localToGlobal(Offset.zero);
      if(scrollController.offset>=position.dy){
        DefaultTabController.of(tabContext!).animateTo(i, duration: Duration(milliseconds: 100));
      }
    }
 }
 Future<void>scrollToIndex(int index)async{
    scrollController.removeListener(animateToTab);
    final categories=keys[index].currentContext!;
    await Scrollable.ensureVisible(categories,
    duration: Duration(milliseconds: 1000));
    scrollController.addListener(animateToTab);
 }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: Builder(
            builder: (context) {
            tabContext=context;
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    _buildCategoryTitle('Ernings', 0),
                      _buildItemList(JewelleryRepository.earnings),
                    _buildCategoryTitle('Ring', 1),
                    _buildItemList(JewelleryRepository.ring),
                    _buildCategoryTitle('Diamond', 2),
                    _buildItemList(JewelleryRepository.diamond),
                  ],
                ),
              );
            }
          ),
        ));
  }


AppBar _buildAppBar(){
  return AppBar(
    leading:
    IconButton(onPressed: () {}, icon: const Icon(  Remix.menu_2_line)),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Remix.search_line,
        ),
      )
    ],
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Purchase your Jewellery in a minute with',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Text(
          'JewellGo',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    ),
    bottom: TabBar(
      tabs: const [
        Tab(child: Text('Earnings')),
        Tab(child: Text('Ring')),
        Tab(child: Text('Diamond')),
      ],
      onTap: (int index) => scrollToIndex(index),
    ),
  );
}
/// Category Title
Widget _buildCategoryTitle(String title, int index) {
  return Padding(
    key: keys[index],
    padding: const EdgeInsets.only(top: 14, right: 12, left: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View more',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.indigo),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    ),
  );
}
/// Single Product item widget
Widget _buildSingleItem(JewelleryModel item) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "€${item.price}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "€${item.price + 26.07}",
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 13,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const Icon(Remix.arrow_right_s_line)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}
Widget _buildItemList(List<JewelleryModel> categories){
return Column(
  children: categories.map((item)=>_buildSingleItem(item)).toList(),
);
}
}