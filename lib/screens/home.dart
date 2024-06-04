import 'package:firebase/screens/sign%20in.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('LOGINTO',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>SignIn() ,));
          }, icon:
          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 50,weight: 20,)),
        ],),
      ),
    );
  }
}
