import 'package:dio/dio.dart';
import 'package:randi/data/providers/api.dart';

class HomeRepository {
  ApiProvider api;
  HomeRepository(this.api);
  // yg di atas itu constructor buat akses Class ApiProvider

  Future getListUsers() async {
    try {
      // pake try catch biar enak liat errornya
      var response = await api
          .ListUsers(); // akses method ListUsers() yang ada di dalem class ApiProvider trus di masukin ke dalem var response

      return response
          .data['data']; // nge return isi json yang di dalem key 'data' aja.
    } catch (e) {
      throw Exception(e.runtimeType == DioError
          ? (e as DioError).error
          : "cekNotifBerlangganan Terjadi Kesalahan, Silahkan Coba Lagi");
    }
  }
}
