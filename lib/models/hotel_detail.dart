// 1) Create the class
class HotelDetail {
  // 2) Create the property
  final int id;
  final String name;
  final String address;
  final String description;
  final String phone;
  final String picUrl;
  final String policy;

  // 3) Create the constructor -> Pembina object (Kita bina objek dari fromJson method )
  HotelDetail(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.picUrl,
      required this.policy,
      required this.description});

  // 4) Create the fromJson factory

  factory HotelDetail.fromJson(dynamic jsonResponse) {
    var json = jsonResponse["data"];
    print(json);
    return HotelDetail(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        picUrl: json["pic_url"],
        policy: json["policy"],
        description: json["description"]);
  }
}
