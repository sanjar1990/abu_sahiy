import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/storage/auth/auth_holder.dart';
import '../../data/tools/service/connectivity_service/connection.dart';
import '../../data/tools/strings/string.dart';
import '../../domain/entities/login/login_request.dart';
import '../../domain/use_case/login/login_use_case.dart';
import '../base/base_controller.dart';


class LoginController extends BaseController {
  bool isLoading = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  @override
  dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    String password = passwordController.text.trim();
    String userName = userNameController.text.trim();
    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
      return;
    }
    //#check field completeness
    if (password.isEmpty || userName.isEmpty) {
      Get.snackbar(Strings.appName.tr, Strings.requiredField.tr);
      return;
    }
    LoginRequest request = LoginRequest(Get.find<AuthHolder>().fcmToken, password, userName);
    loginUseCase.invoke(request).listen((event) {
      event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            final value = content.toJson();
            if (value['isError'] == true) {
              Get.snackbar(Strings.appName.tr, value['message'].toString());
            }
            else if(value['isError'] == false) {
              Get.find<AuthHolder>().authToken = content.date!.jwt!;
              /*Get.find<AuthHolder>().roleList = content.date!.roleList;
              Get.find<AuthHolder>().currentRole = content.date!.roleList[0];
              Get.find<AuthHolder>().branchID = content.date!.branchId ?? '';
              if (Get.find<AuthHolder>().currentRole == 'ROLE_OPERATOR'){
                Get.offAll(() =>  const DashBoardPage() , transition: Transition.rightToLeft);
                return ;
              } else if (Get.find<AuthHolder>().currentRole == 'ROLE_B_MANAGER') {
                Get.offAll(() => const HomePage(isBManager: true,) , transition: Transition.rightToLeft);
                return ;
              } if (Get.find<AuthHolder>().currentRole == 'ROLE_O_MANAGER') {
                Get.offAll(() => const HomePage(isBManager: false,) , transition: Transition.rightToLeft);
                return ;
              }*/
            } else {
              Get.snackbar(Strings.appName.tr, Strings.unKnownError);
              return ;
            }
            update();
          },
          error: (error) => Get.snackbar(Strings.appName.tr, '$error'));
    })
      ..onDone(() {
        isLoading = false;
        update();
      })
      ..addTo(subscribe);
  }




}
