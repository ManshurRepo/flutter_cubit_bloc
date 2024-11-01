import 'package:flutter_cubit_bloc/domain/core/user/user_data2.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _listUserData = List<UserData2>.empty(growable: true);

  addDataToList(UserData2 data) {
    _listUserData.add(data);
    update();
  }

  List<UserData2> get getListUserData => this._listUserData;

  deleteDataOnList(UserData2 data) {
    _listUserData.remove(data);
    update();
  }
}
