import 'package:flutter/material.dart';
import 'package:kangonjo/ui/consumir.dart';
import 'package:kangonjo/ui/dados.dart';
import 'package:kangonjo/ui/dadoss.dart';
import 'package:kangonjo/ui/homepage.dart';
import 'package:kangonjo/ui/inicio.dart';
import 'package:kangonjo/ui/login.dart';
import 'package:kangonjo/ui/notas.dart';

void main(){

  runApp(meuapp());
}

class meuapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Kangonjo",
      home: Login()
    );
  }
}

