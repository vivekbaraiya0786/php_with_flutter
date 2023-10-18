import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
  }

  List userdata = [];

  getrecord()async{
    String uri = "http://10.0.2.2/website/api/fetch_api.php";

    try{
      var respons = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(respons.body);
      });
    }catch(e){
      print("Error $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Data"),
      ),
      body: ListView.builder(itemCount: userdata.length,itemBuilder: (context, index) {
        print("data : $userdata");
        return ListTile(
          title: Text("${userdata[index]['name']}"),
        );
      },),
    );
  }
}
