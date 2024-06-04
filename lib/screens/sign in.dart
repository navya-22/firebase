import 'package:firebase/screens/verify.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _phonecontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sign Up with your Phone📞',
        style: TextStyle(fontSize: 32),),
    automaticallyImplyLeading: false,),
    body:Center(
    child: Form(
    key: _formkey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Sign up with your phon number:',style: TextStyle(fontSize: 18),),
        Container(
          padding: EdgeInsets.all(20),

          height: 100,
          width: 400,
          child: TextFormField(
            controller: _phonecontroller,
            validator: (value) {
              RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

              if (value == 0) {
                return 'Please enter mobile number';
              } else if (!regExp.hasMatch(value!)) {
                return 'Please enter valid mobile number';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                labelText: 'Phone'),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              width: 200,
              height: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verify(),));
                    }
                  }, child: const Text('Sign Up',style: TextStyle(color: Colors.white),)),
            ),
            // SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              width: 200,
              height: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    Navigator.pop(context);
                  }, child:const Text('Cancel',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ],
    ),),
    ),
    );
  }
}
