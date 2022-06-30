import 'package:flutter/material.dart';
import 'package:traveloka_app/models/hotel_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

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
      hotel = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body:Text("Detail")
    );
  }


  Future<HotelDetail> fetchHotelDetail() async {
    final response = await http
        .get(Uri.parse('https://wanmuz-traveloka-api.herokuapp.com/api/hotels/1'));

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
