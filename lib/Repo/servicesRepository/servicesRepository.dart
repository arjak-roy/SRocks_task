import 'package:s_rocks/Models/service.dart';

abstract class ServicesRepository {
  Future<List<serviceModel>> getServices();
}