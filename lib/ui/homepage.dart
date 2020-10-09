import 'package:flutter/material.dart';
import 'package:kangonjo/ui/notas.dart';

import 'login.dart';

class Homepage extends StatefulWidget {
  Homepage({this.nome, this.curso,this.codigo});
  final String nome;
  final String curso;
  final String codigo;
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(

                decoration: BoxDecoration(
                  color: Color(0xFF206081)
                ),

                child: Row(
                  children: [Image.asset("assets/logo.png", width: 100,),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("${  widget.nome.substring(0,10)} \n ${widget.curso}\n Nº: ${widget.codigo}", style: TextStyle(color: Colors.white,fontSize: 15.0),),
                  ),],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  color: Color(0xFFDFE5E8),
                  child: FlatButton(
                    child: Text('MINHAS NOTAS'),
                    onPressed: () { Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>Notas(codigo: widget.codigo,)
                        )
                    );},

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  color: Color(0xFFDFE5E8),
                  child: FlatButton(
                    child: Text('MINHAS AULAS'),
                    onPressed: () {},

                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  color: Color(0xFFDFE5E8),
                  child: FlatButton(
                    child: Text('LOGOUT'),
                    onPressed: () {
                      _showMyDialog();
                      },

                  ),
                ),
              ),
            ],
          )),

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

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Oque deseja fazer:",style: TextStyle(color:Color(0xFF043E5B),fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF206081),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),

                          child:

                        FlatButton(onPressed: (){
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context)=>Notas(codigo: widget.codigo)
                              )
                          );
                        },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(Icons.event_note,size: 65,color: Colors.white),
                                Text("NOTAS",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 17),),
                              ],
                            ),
                          ),
                        )),
                      ),

                 /*     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF043E5B),
                                borderRadius: BorderRadius.circular(20),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3), // changes position of shadow
    ),
  ]),

                            child:

                            FlatButton(onPressed: (){ Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context)=>Notas()
                                )
                            );},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(Icons.live_tv,size: 65,color: Colors.white,),
                                    Text("AULAS",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 17),),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      */

                    ],
                  )




















    ]),
        ),
      ),

        );
  }


    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Saindo...'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
              
                  Text('Tem certeza que deseja sair?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => Login()),
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ],
          );
        },
      );
    }

  }



