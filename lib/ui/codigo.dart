import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kangonjo/ui/homepage.dart';
class Codigo extends StatefulWidget {
  Codigo({this.nome});
  final String nome;

  @override
  _CodigoState createState() => _CodigoState();
}

class _CodigoState extends State<Codigo> {
  TextEditingController controllerCodigo = TextEditingController();


  var _sms="Insira seu código de estudante iska:";

  get nome => null;
  @override
  Future<List> _getUsers() async {

    final response = await http.get("https://iskaluanda.net/app/users");

    var novo=json.decode(response.body);





    print(novo[0]['codigoAluno']);
    int codigo=200230;
    for(var i=0; i<novo.length; i++){

     // print(novo[i]['nome']);

var dada=novo[i]['codigoAluno'];
    if(int.parse(controllerCodigo.text)==int.parse(dada)) {

      print("Welcome Master - ${novo[i]['nome']}");
      var nome= novo[i]['nome'];
      var curso= novo[i]['curso'];
      var codigo= novo[i]['codigoAluno'];

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Homepage(nome: nome,curso: curso,codigo: codigo,)),
              (Route<dynamic> route) => false
      );
      break;
    }else {

      print("Camarada, vai estudar...");
      setState(() {
           _sms="Código Invalido!";

      });
    }

    }
    }



  /*@override
  void initState() {
    _getUsers();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF206081),

      body:  SingleChildScrollView(
        child: Column(
            children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
          child:

          Column(
            children: [Image.asset("assets/logotipo.png"),
            ],
          )
    ),



  Text("  ${"Olá! "+widget.nome+", Insira seu Código"}", style: TextStyle(color: Colors.white,fontSize: 15),),

Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(

                      border: new Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerCodigo,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Icon(Icons.lock_open,color: Colors.white,),
                        ),
                    hintText: "Seu código",
hintStyle: TextStyle(color: Colors.white),


                      border: InputBorder.none

                  ),

                  ),
                ),
              ),
              FlatButton(onPressed:(){},child: Text("Esqueci o meu código",style: TextStyle(color: Colors.white),)),

      Container(
        width: 200,
          decoration: BoxDecoration(

              border: new Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(30)

          ),
          child: FlatButton(onPressed: _getUsers, child: Text("LOGIN",style: TextStyle(fontSize:17,fontWeight:FontWeight.bold,color: Colors.white),)))
  ]),
      ),
    );
  }
}
