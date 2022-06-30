import 'package:flutter/material.dart';
import '../models/hotel_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {

  final int id;

  DetailPage({required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  HotelDetail? hotel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHotelDetail().then((value) => {
          setState(() {
            hotel = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
        ),
        body: hotel == null
            ? CircularProgressIndicator()
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Text(hotel!.name, style: TextStyle(color: Colors.red, fontSize: 32),),
                    SizedBox(),
                    Image.network(hotel!.picUrl),
                    SizedBox(height: 10,),
                    Text(hotel!.description),
                    SizedBox(height: 10,),
                    Text(hotel!.address),
                    SizedBox(height: 10,),
                    Text(hotel!.policy)
                  ],
                ),
            ));
  }

  Future<HotelDetail> fetchHotelDetail() async {
    final response = await http.get(
        Uri.parse('https://wanmuz-traveloka-api.herokuapp.com/api/hotels/${widget.id}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HotelDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load HotelDetail');
    }
  }
}
