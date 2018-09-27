import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget{
  @override
  DetailStatus createState()=>DetailStatus();
}
class DetailStatus extends State<DetailPage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
       appBar: new AppBar(
         title: const Text('this is detail'),
       ), 
       body: new Container(
         child:const Text('data')
       ),
    );
  }
}

