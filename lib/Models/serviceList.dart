import 'package:s_rocks/Models/service.dart';

class serviceList {
  final List<serviceModel> services;
  serviceList({required this.services});

  factory serviceList.fromList(List<serviceModel> services) => serviceList(services: services);
}