import 'package:flutter/material.dart';
import '../models/hotel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<Hotel> hotels = [

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHotels().then((data){
      setState((){
        hotels = data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traveloka app"),),
      body:ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context,position){
        return ListTile(
          leading: Image.network(hotels[position].picUrl),
          title: Text(hotels[position].name),
          subtitle: Text(hotels[position].email),
          trailing: Icon(Icons.chevron_right),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>DetailPage())
            );
          },
      );
      })
    );
  }

  Future<List<Hotel>> fetchHotels() async {
    final response = await http
        .get(Uri.parse('https://wanmuz-traveloka-api.herokuapp.com/api/hotels'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return Hotel.hotelsFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load hotels');
    }
  }
}
