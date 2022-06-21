import 'dart:convert';

import 'package:get/get.dart';
import 'package:randi/modules/repositories/home_repository.dart';

import '../../../models/user_model.dart';

class HomeController extends GetxController {
  HomeRepository repository;
  HomeController(this.repository);
  // yg di atas itu constructor buat akses Class HomeRepository

  List<UserModel> users =
      []; // deklarasiin List of UserModel dan di inisialisasi pake list kosong

  getUsers() async {
    var data = await repository
        .getListUsers(); // ambil data dari getListUsers -> masukin ke var data
    var objJson =
        data as List; // datanya di parse jadi List -> masukin ke var objJson

    List<UserModel> listUserModel = objJson
        .map((e) => UserModel.fromJson(e))
        .toList(); // pake .map() biar yang dynamic di ubah jadi object UserModel trus di jadiin list pake .toList()
    // print('datanya $listUserModel');

    users = listUserModel; // masukin ke dalem List<UserModel>
    print(
        users); // hasilnya bakal jadi instance of UserModel , berarti hasilnya udah masuk ke dalem model data. tinggal nanti di mainpage di olah datanya
    update(); // gantinya setState kalo di statefull ( biar ngetriger si view buat nge refresh page kalo ada perubahan)
  }
}
