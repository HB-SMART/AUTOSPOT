import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kangonjo/ui/codigo.dart';
import 'package:kangonjo/ui/homepage.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerTelefone = TextEditingController();

  var _sms="Insira seu número de telefone:";
  @override
  Future<List> _getUsers() async {

    final response = await http.get("https://iskaluanda.net/app/users");

    var novo=json.decode(response.body);





    print(novo[0]['codigoAluno']);
    int codigo=200230;
    for(var i=0; i<novo.length; i++) {
      // print(novo[i]['nome']);

      var dada = novo[i]['telefone'];
      if (controllerTelefone.text.isEmpty) {
        setState(() {
          _sms = "Insira algo,Porfavor";
        });
      } else {
        if (int.parse(controllerTelefone.text) == int.parse(dada)) {
          print("Welcome Master - ${novo[i]['nome']}");

          var nome= novo[i]['nome'];
          Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => Codigo(nome: nome,))
          );

          break;
        } else {
          print("Camarada, vai estudar...");
          setState(() {
            _sms = "Número de Telefone Invalido";
          });
        }
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



  Text("$_sms", style: TextStyle(color: Colors.white,fontSize: 15),),

Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(

                      border: new Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controllerTelefone,

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Icon(Icons.phone,color: Colors.white,),
                        ),
                    labelText: "+244",
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    hintText: "Telefone",
hintStyle: TextStyle(color: Colors.white),


                      border: InputBorder.none

                  ),

                  ),
                ),
              ),


      Container(
        width: 200,
          decoration: BoxDecoration(

              border: new Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(30)

          ),
          child: FlatButton(onPressed: _getUsers, child: Text("ENTRAR",style: TextStyle(fontSize:17,fontWeight:FontWeight.bold,color: Colors.white),)))
  ]),
      ),
    );
  }
}
