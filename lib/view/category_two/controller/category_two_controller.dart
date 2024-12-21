import 'package:abu_sahiy/controller/base/base_controller.dart';
import 'package:flutter/material.dart';

class CategoryTwoController extends BaseController {
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();
  List<Photo> photoModelList=[];
  List<Category> categoryList=[];
  int pageIndex = 0;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    updatePhotoList();
    createData();
  }
  void createData(){
    photoModelList = [
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
      Photo(name: 'women', photoPath: 'women_clothes.jpg'),
    ];
    categoryList= [
      Category(categoryName: 'categoryName1', photo: photoModelList),
      Category(categoryName: 'categoryName2', photo: photoModelList),
      Category(categoryName: 'categoryName3', photo: []),
      Category(categoryName: 'categoryName4', photo: []),
      // Populate this with your categories and photos
    ];
  }

  void updatePhotoList() {
    photoModelList = categoryList[pageIndex].photo;
    update();
  }

  Future<void> loadNextCategory() async {
    if (pageIndex + 1 < categoryList.length) {
      isLoading = true;
      update();

      await Future.delayed(const Duration(seconds: 1)); // Simulated loading delay
      pageIndex++;
      pageController.jumpToPage(pageIndex);
      photoModelList.addAll(categoryList[pageIndex].photo);

      isLoading = false;
      update();
    }
  }

  Future<void> loadPreviousCategory() async {
    if (pageIndex > 0) {
      isLoading = true;
      update();

      await Future.delayed(const Duration(seconds: 1)); // Simulated loading delay
      pageIndex--;
      pageController.jumpToPage(pageIndex);
      photoModelList.insertAll(0, categoryList[pageIndex].photo);

      isLoading = false;
      update();
    }
  }
}

class Category {
  final String categoryName;
  final List<Photo> photo;

  Category({required this.categoryName, required this.photo});
}

class Photo {
  final String photoPath;
  final String name;

  Photo({required this.photoPath, required this.name});
}