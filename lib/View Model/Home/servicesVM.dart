
import 'package:flutter/material.dart';
import 'package:s_rocks/Data/Remote/Response/ApiResponse.dart';
import 'package:s_rocks/Models/service.dart';
import 'package:s_rocks/Models/serviceList.dart';
import 'package:s_rocks/Repo/servicesRepository/firebaseservicesRepository.dart';

class Servicesvm extends ChangeNotifier{
  final _servicesRepo = Firebaseservicesrepository();

  ApiResponse<serviceList> servicesMain = ApiResponse.loading();

  void _setServices(ApiResponse <List<serviceModel>> response) {
    servicesMain = ApiResponse.completed(serviceList(services: response.data!));
    notifyListeners();
  }
  Future<void> getServices()async{
  _servicesRepo.getServices()
  .then(
    (value) {
      _setServices(ApiResponse.completed(value));
    } 
    )
  .onError((error, stackTrace) {
      _setServices(ApiResponse.error(error.toString()));
  } 
  );
} 
  }
