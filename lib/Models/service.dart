class serviceModel {
  String? id;
  String? serviceName;
  String? serviceDescription;
  String? assetPath;
  String? iconName;

  serviceModel(
      {this.id,
      this.serviceName,
      this.serviceDescription,
      this.assetPath,
      this.iconName});

  serviceModel.fromDocument(Map<String, dynamic> doc) {
    id = doc['id'] as String?;
    serviceName = doc['serviceName'] as String?;
    serviceDescription = doc['serviceDescription'];
    assetPath = doc['assetPath'];
    iconName = doc['iconName'];
  }

  Map<String, dynamic> toDocument() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    data['serviceDescriptio'] = this.serviceDescription;
    data['assetPath'] = this.assetPath;
    data['iconName'] = this.iconName;
    return data;
  }
}
