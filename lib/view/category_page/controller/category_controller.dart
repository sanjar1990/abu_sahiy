import 'package:abu_sahiy/controller/base/base_controller.dart';
import 'package:abu_sahiy/view/category_page/model/category_model.dart';
import 'package:abu_sahiy/view/category_page/model/photo_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryController extends BaseController {
  late final PageController pageController;
  late final ScrollController scrollController;
  List<PhotoModel> photoModelList = [];
  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    setIndex();
    photoModelList.addAll(categoryList[0].photo);
    pageController = PageController(viewportFraction: 0.4);
    scrollController = ScrollController()..addListener(_scrollListenerTwo);

  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListenerTwo() {

    if (scrollController.offset == scrollController.position.minScrollExtent) {
      print('START REACHED');
      if(pageIndex>0){
        // photoModelList=categoryList[0].photo;
        pageIndex--;
        // pageController.page = pageIndex;
        print('GAGEINDEX::::$pageIndex');
        pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut, // Smooth scroll animation
        );
      }
    } else if (scrollController.offset ==
        scrollController.position.maxScrollExtent) {
      print('END REACHED');

      pageIndex++;
      pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut, // Smooth scroll animation
      );
      photoModelList.addAll(categoryList[pageIndex].photo);
    }
  }

  _scrollListener() {
    if (pageIndex == 0) {}
    if (scrollController.hasClients) {
      if (scrollController.offset <=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print('MINUSSS');
        // if (pageIndex == categoryList.length) {
        //   pageIndex--;
        //   pageController.page != pageIndex;
        //   photoModelList.addAll(categoryList[pageIndex].photo);
        //   pageController.animateToPage(
        //     pageIndex,
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeInOut, // Smooth scroll animation
        //   );
        // }

        update();
      } else if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print('PLUSSSSS');

        // pageIndex++;
        // pageController.page != pageIndex;
        // print('GAGEINDEX::::$pageIndex');
        // pageController.animateToPage(
        //   pageIndex,
        //   duration: const Duration(milliseconds: 300),
        //   curve: Curves.easeInOut, // Smooth scroll animation
        // );

        photoModelList.addAll(categoryList[pageIndex].photo);
        update();
      }
    }
  }

  Future<void> setIndex() async {
    print('SET INDEX');
    int index=0;
    for (var e in categoryList) {
      for (var p in e.photo) {
        p.index=index;
      }
      print('INDEXXXX:::$index');
      index++;
    }

  }

  List<CategoryModel> categoryList = [
    CategoryModel(
      categoryName: 'Ayollar kiyimi',
      photo: [
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
        PhotoModel(name: 'women', photoPath: 'women_clothes.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Erkaklar kiyimi',
      photo: [
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
        PhotoModel(name: 'men', photoPath: 'men_clothes.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Bolalar kiyimi',
      photo: [
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
        PhotoModel(name: 'kids', photoPath: 'kids_clothes.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Elektronika',
      photo: [
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
        PhotoModel(name: 'electroniks', photoPath: 'electroniks.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Oyoq kiyimlar',
      photo: [
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
        PhotoModel(name: 'shoes', photoPath: 'shoes.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Aksessuarlar',
      photo: [
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
        PhotoModel(name: 'accessuar', photoPath: 'accessuar.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'O\'yinchoqlar',
      photo: [
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
        PhotoModel(name: 'toys', photoPath: 'toys.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Parfumeriya',
      photo: [
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
        PhotoModel(name: 'parfumes', photoPath: 'parfumes.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Uy-ro\'zg\'or',
      photo: [
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
        PhotoModel(name: "uy_ro'zg'or", photoPath: "uy_ro'zg'or.jpg"),
      ],
    ),
    CategoryModel(
      categoryName: 'Maishiy texnika',
      photo: [
        PhotoModel(name: 'washing_machine', photoPath: 'washing_machine.jpg'),
      ],
    ),
    CategoryModel(
      categoryName: 'Soatlar',
      photo: [
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
        PhotoModel(name: 'watch', photoPath: 'watch.jpg'),
      ],
    ),
  ];
}
