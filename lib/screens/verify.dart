import 'package:firebase/screens/detail.dart';
import 'package:firebase/screens/screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
           // height: 200,
            width: 400,
            child: Column(
              children: [
                const Text('Enter the OTP for verification',style: TextStyle( fontSize: 20),),
                SizedBox(height: 30,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Spacer(),
                   SizedBox(
                     height: 64,
                     width: 68,
                     child: TextFormField(
                       onSaved: (pin1){},
                       onChanged: (value) {
                         if(value.length==1){
                           FocusScope.of(context).nextFocus();
                         }
                       },
                       decoration: const InputDecoration(hintText: '0'),
                       style: Theme.of(context).textTheme.headline6,
                       keyboardType: TextInputType.number,
                       textAlign: TextAlign.center,
                       inputFormatters: [
                         LengthLimitingTextInputFormatter(1),
                         FilteringTextInputFormatter.digitsOnly,
                       ],
                     ),
                   ),
                Spacer(),
                SizedBox(
                  height: 64,
                  width: 68,
                  child: TextFormField(
                    onSaved: (pin2){},
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(hintText: '0'),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 64,
                  width: 68,
                  child: TextFormField(
                    onSaved: (pin3){},
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(hintText: '0'),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 64,
                  width: 68,
                  child: TextFormField(
                    onSaved: (pin4){},
                    onChanged: (value) {
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: const InputDecoration(hintText: '0'),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                 ],
               ),
                SizedBox(height: 100,),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details(),));
                }, child: Text('Verify')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
