import 'package:abu_sahiy/view/category_six/category_six.dart';
import 'package:get/get.dart';


class RouteHelper {
  static const String initial = '/';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String categorySix = '/category_six';


  static String getInitial() => initial;
  static String getSignIn() => signIn;
  static String getSignUp() => signUp;
  static String getCategorySix() => categorySix;




  static List<GetPage> routes = [
    GetPage(
        name: categorySix,
        page: () => const CategorySix(),
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
