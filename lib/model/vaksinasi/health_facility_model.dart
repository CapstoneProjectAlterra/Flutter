class HealthFacilityModel {
  String? city;
  String? district;
  String? facilityName;
  int? id;
  String? imgUrl;
  String? officeNumber;
  int? postalCode;
  String? province;
  String? streetName;
  String? villageName;
  HealthFacilityModel({
    required this.city,
    required this.district,
    required this.facilityName,
    required this.id,
    required this.imgUrl,
    required this.officeNumber,
    required this.postalCode,
    required this.province,
    required this.streetName,
    required this.villageName,
  });

  factory HealthFacilityModel.fromJson(Map<dynamic, dynamic> json) =>
      HealthFacilityModel(
        city: json['city'],
        district: json['district'],
        facilityName: json['facility_name'],
        id: json['id'],
        imgUrl: json['img_url'],
        officeNumber: json['office_number'],
        postalCode: json['postal_code'],
        province: json['province'],
        streetName: json['street_name'],
        villageName: json['village_name'],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "district": district,
        "facility_name": facilityName,
        "id": id,
        "img_url": imgUrl,
        "office_number": officeNumber,
        "postal_code": postalCode,
        "province": province,
        "street_name": streetName,
        "village_name": villageName
      };
}
