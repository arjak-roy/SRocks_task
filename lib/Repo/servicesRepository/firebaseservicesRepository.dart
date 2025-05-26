import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s_rocks/Models/service.dart';
import 'package:s_rocks/Repo/servicesRepository/servicesRepository.dart';

class Firebaseservicesrepository implements ServicesRepository {
  final serviceCollection = FirebaseFirestore.instance.collection('services');
  @override
  Future<List<serviceModel>> getServices() async {
    try {
      final response = await serviceCollection.get().timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw Exception('Request timed out');
        },
      );

      print(
        'Response: ${response.docs.map((doc) => serviceModel.fromDocument(doc.data()))}',
      );
      
            return response.docs.map((doc) => serviceModel.fromDocument(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }
  
}