import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class teste extends StatefulWidget {
  @override
  _testeState createState() => _testeState();
}

class _testeState extends State<teste> {
  Future<List> _getUsers() async {

    final response = await http.get("https://iskaluanda.net/app/users");
    return json.decode(response.body);
  }

  @override
  void initState() {
    _getUsers();
  }

  /*
 Future<dynamic> GetName() async {
  final response = await http.get("https://martindala.000webhostapp.com/getdata.php");
 return json.decode(response.body);
}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder<List>(

                future: _getUsers(),

                builder: (context,snapshot) {
                  if (snapshot.hasData) {
                    return  SizedBox(

                            child:(
                       ListView.builder(  itemCount: snapshot.data.length,
                            itemBuilder: (context,index) {
                              List list = snapshot.data;
                              return Card(
                                  elevation:5,

                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                                child: ListTile( title: Text(list[index]["nome"]),
                                subtitle: Text(list[index]["telefone"])),
                              );



                              } )),

                    );




                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");

                  } else {
                    return Center(child: CircularProgressIndicator(backgroundColor: Color(0xFF043E5B),));
                  }

                }),


    );
  }
}
