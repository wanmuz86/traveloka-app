// 1) Create the class (objek yang nyata/ ada di dunia ini)
class Hotel {

  // 2) Create the properties (ciri-ciri)
  final int id;
  final String name;
  final String email;
  final String picUrl;

// 3) Create constructor -> Pembuat objek
Hotel({required this.id, required this.name, required this.email, required this.picUrl});

// 4) Create json to object transformer

factory Hotel.fromJson(Map<String,dynamic> json){
  return Hotel(
    id:json["id"],
    name:json["name"],
    email:json["email"],
    picUrl: json["pic_url"]
  );
}

// json to List
  static List<Hotel> hotelsFromJson(dynamic json){
    var searchResult = json["data"];
    List<Hotel> results = new List.empty(growable: true);

    if (searchResult != null){
      searchResult.forEach((v)=>{
        results.add(Hotel.fromJson(v))
      });
      return results;
    }
    return results;
  }

}