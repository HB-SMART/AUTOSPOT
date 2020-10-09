import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class dados extends StatefulWidget {
  @override
  _dadosState createState() => _dadosState();
}

class _dadosState extends State<dados> {

  Future<List<dynamic>> _getUsers() async{
var url="https://martindala.000webhostapp.com/getdata.php";
    http.Response response= await http.get(url);
    var data=json.decode(response.body);
      return data;
    //print(data.toString());
  }
  @override
  void initState(){
_getUsers();
  }
  /*
 Future<dynamic> GetName() async {
  final response = await http.get("https://martindala.000webhostapp.com/getdata.php");

  return json.decode(response.body);

}

F


*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Color(0xFF043E5B),


        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<dynamic>>(
                future: _getUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");

                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),






    );


  }


}