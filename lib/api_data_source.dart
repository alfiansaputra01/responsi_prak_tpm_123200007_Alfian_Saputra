import 'dart:core';
import 'package:http/http.dart';

import 'base_network.dart';

class ApiDataSource  {
  static ApiDataSource instace = ApiDataSource();

  Future<Map<String, dynamic>>loadBerita(){
    return BaseNetwork.get("data");
  }

  Future<Map<String, dynamic>>loadDetailBerita(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetwork.get("data/$post");
  }

  loadUserById(int idUser) {}
}