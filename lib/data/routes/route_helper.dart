import 'package:abu_sahiy/view/category_page/pages/category_page.dart';
import 'package:abu_sahiy/view/category_three/category_three_page.dart';
import 'package:abu_sahiy/view/category_two/pages/category_two_page.dart';
import 'package:abu_sahiy/view/jewelery/page/final_view.dart';
import 'package:abu_sahiy/view/main_category/page/main_category_page.dart';
import 'package:abu_sahiy/view/test/test.dart';
import 'package:get/get.dart';


class RouteHelper {
  static const String initial = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String categoryPage = '/category_page';
  static const String categoryTwo = '/category_two';
  static const String test = '/test';
  static const String categoryThree = '/category_three';
  static const String finalView = '/final_view';
  static const String mainCategory = '/main_category';



  static String getInitial() => initial;

  static String getSignIn() => signIn;

  static String getSignUp() => signUp;
  static String getCategoryPage() => categoryPage;
  static String getCategoryTwo() => categoryTwo;
  static String getTest() => test;
  static String getCategoryThree() => categoryThree;
  static String getFinalView() => finalView;
  static String getMainCategory() => mainCategory;




  static List<GetPage> routes = [
    GetPage(
        name: categoryPage,
        page: () => const CategoryPage(),
        transition: Transition.fadeIn),

    GetPage(
        name: categoryTwo,
        page: () => const CategoryTwoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: test,
        page: () => const Test(),
        transition: Transition.fadeIn),
    GetPage(
        name: categoryThree,
        page: () => const CategoryThreePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: finalView,
        page: () => const FinalView(),
        transition: Transition.fadeIn),
    GetPage(
        name: mainCategory,
        page: () => const MainCategoryPage(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: audioPlayerPage,
    //     page: () => const AudioPlayerPage(),
    //     transition: Transition.fadeIn),

    // GetPage(name: signUp, page: () => const SignUpPage()),
    // GetPage(
    //     name: mapScreen,
    //     page: () {
    //       var location = Get.parameters['location'];
    //       var isSelecting = Get.parameters['isSelecting'];
    //       return MapScreen(
    //         location: location as PlaceLocation,
    //         isSelecting: isSelecting as bool,
    //       );
    //     }),
    // GetPage(
    //     name: smsVerification,
    //     page: () => const SmsVerification(),
    //     transition: Transition.fadeIn),
    //
    // GetPage(
    //     name: passwordChange,
    //     page: () => const PasswordChange(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: aboutUs,
    //     page: () => const AboutUs(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: phoneChange,
    //     page: () =>  PhoneChangeVerification(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: home,
    //     page: () => const HomePage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: profileAccount,
    //     page: () => const Profile(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: myAds,
    //     page: () => const ProfilePostPage(),
    //     transition: Transition.leftToRight,
    //     transitionDuration: const Duration(seconds: 1)),
    // GetPage(
    //   name: notification,
    //   page: () => const Notifications(),
    //   transition: Transition.fadeIn,
    //   // transitionDuration: const Duration(seconds: 1)
    // ),
    // GetPage(
    //     name: createPost,
    //     page: () =>  const CreatePost(),
    //     transition: Transition.fadeIn),
    //
    // GetPage(
    //     name: postDetail,
    //     page: () => const PostDetailPage(),
    //  ),
    // GetPage(
    //     name: likePostPage,
    //     page: () => const LikePostPage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: imageOpen,
    //     page: () =>  ImageOpen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: updateProfilePassword,
    //     page: () =>  const UpdateProfilePassword(),
    //     transition: Transition.fadeIn),
  ];
}
