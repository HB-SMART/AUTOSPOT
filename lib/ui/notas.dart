import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
class Notas extends StatefulWidget {
  Notas({this.codigo});
  final String codigo;
  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {

  Future _getNotas() async {
var id=widget.codigo;

    final response = await http.get("https://iskaluanda.net/app/user/nota/$id");

    var dates=json.decode(response.body);



        return dates;



  }
  Future<List> _getUsers() async {

    final response = await http.get("https://iskaluanda.net/app/users");
    return json.decode(response.body);
  }

  @override
  void initState() {
    _getNotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Color(0xFF206081),

      ),

      body:   SingleChildScrollView(
        child: SafeArea(
          child: Column(
                children: [

              Container(
                width: MediaQuery.of(context).size.width,
              height: 259,
              color: Color(0xFF206081),

                child: Image.asset("assets/dfd.png"),

              ),

          SizedBox(
              height: 20),

                  Text("Minhas notas",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),
                  FutureBuilder(

                      future: _getNotas(),

                      builder: (context,snapshot) {
                        if (snapshot.hasData) {
                          return  SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child:(
                                ListView.builder(  itemCount: snapshot.data.length,
                                    itemBuilder: (context,index) {
                                      List list = snapshot.data;
                                      return Card(
                                        elevation:5,
                                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
                                        child: ListTile(  title: Text( list[index]["subject"],style: TextStyle(color:Color(0xFF043E5B),fontWeight: FontWeight.bold,fontSize: 18),),
                                            subtitle: Text("Nota: "+list[index]["marks"],style: TextStyle(color:Color(0xFF043E5B),fontWeight: FontWeight.bold,fontSize: 15),)),
                                      );



                                    } )),

                          );




                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");

                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(38.0),
                            child: Column(
                              children: [
                                SizedBox(height: 100,),
                                Center(

                                    child: CircularProgressIndicator(backgroundColor: Color(0xFF043E5B),)),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Carregando...",style: TextStyle(color:Color(0xFF043E5B),fontWeight: FontWeight.bold,fontSize: 18),),
                                )
                              ],
                            ),
                          );
                        }

                      }),


   ]
                  )

    ))

        );
  }
}
