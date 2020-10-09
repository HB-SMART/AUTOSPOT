import 'package:flutter/material.dart';

  class inicio extends StatefulWidget {
  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(

          image: DecorationImage(image:AssetImage("assets/fundo.jpg"), fit: BoxFit.cover)
        ),

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

SizedBox(height: 120,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF043E5B),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: FlatButton(
                      hoverColor: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {}, child: Text("INICIAR",style: TextStyle(fontFamily: "Trebuchet M", color: Colors.white,fontWeight: FontWeight.bold, fontSize: 17),))),
            )
,

            SizedBox(height: 180,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Feito pela: www.hbsmart.co.ao",style: TextStyle(color: Color(0xFF707070)),),
            )
          ],
        ),
      )




    );
  }
}
