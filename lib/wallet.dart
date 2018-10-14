import 'package:flutter/material.dart';
class WalletPage extends StatefulWidget{
  @override
  WalletState createState()=> WalletState();
}
class WalletState extends State<WalletPage>{
 @override
 Widget build(BuildContext context){
   return new ListView(
     children: <Widget>[
       new ListTile(
         leading:Icon(Icons.volume_up),
         title:new Text('this is a title'),
         subtitle: new Text('这是副标题'),
         selected: true,
       ),
       new Divider(height: 1.0,),
       new ListTile(
         leading:Icon(Icons.volume_up),
         title:new Text('this is a title'),
         subtitle: new Text('这是指标'),
         trailing: new Icon(Icons.bluetooth),
         enabled: true,
       ),
       new Divider(),
       new ListTile(
         leading:Icon(Icons.volume_up),
         title:new Text('this is a title'),
         subtitle: new Text('这是指标'),
         trailing: new Icon(Icons.bluetooth),
         enabled: true,
       )
     ],
   );
 }
}