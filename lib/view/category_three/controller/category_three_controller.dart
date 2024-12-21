import 'package:abu_sahiy/controller/base/base_controller.dart';
import 'package:abu_sahiy/view/category_page/model/category_model.dart';
import 'package:abu_sahiy/view/category_page/model/photo_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryThreeController extends BaseController{
  int currentScrollIndex=0;
 late final ScrollController scrollController;
  final containerHeight=850.0;
  int pageIndex=0;
  List<PhotoModel>photoModelList=[];
 @override
 void onInit(){
   super.onInit();
   // setPhotoList();
   scrollController=ScrollController();
   scrollController.addListener(_updateScrollIndicator);

 }
  Future<void> setPhotoList() async {
   await setIndex();
  for (var e in categoryList) {
    photoModelList.addAll(e.photo);
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
  final List<Map<String,List<PhotoModel>>> elements = [
    {'group': [
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
    ],},
    {
      'group': [
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
    ],},
    {
      'group':[
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
    ] ,},
    {
      'group': [
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
    ] ,},

  ];
 void _updateScrollIndicator(){
   currentScrollIndex=scrollController.offset ~/ containerHeight;
    // currentScrollIndex=pageIndex;
   update();
 }
 void onCategoryTap(int index){
  scrollController.animateTo(
      index*containerHeight,
      duration : Duration(
          milliseconds: 300
      ), curve: Curves.easeIn);
  currentScrollIndex=index;
  update();
 }
}