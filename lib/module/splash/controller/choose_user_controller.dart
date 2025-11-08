import 'package:get/get.dart';

class ChooseUserController extends GetxController {

  RxString chooseUseRole = "".obs;

  void chooseUser({required String useRole}) {
    chooseUseRole.value = useRole;
  }

}