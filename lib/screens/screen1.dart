import 'package:firebase/screens/detail.dart';
import 'package:firebase/service/firestoreservices.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController _pricecontroller =TextEditingController();
final TextEditingController _namecontroller =TextEditingController();
final TextEditingController _detailcontroller = TextEditingController();
final _formkey =GlobalKey<FormState>();
final Firestore= firestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter your product',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your product name :',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please Enter Product Name ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Product Name '),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your product price :',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _pricecontroller,
                      validator: (value) {
                        RegExp regExp = RegExp(r'^[1-9]\d{0,7}(?:\.\d{1,4})?|\.\d{1,4}$');
        
                        if (value == 0) {
                          return 'Please enter  the price';
                        } else if (!regExp.hasMatch(value!)) {
                          return 'Please enter the price of the product';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Product Price '),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Describe about your product :',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _detailcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Product Details '),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      fixedSize: MaterialStatePropertyAll(Size(180, 50))),
                  onPressed: () {
                    String name =_namecontroller.text;
                    String price =_pricecontroller.text;
                    String detail =_detailcontroller.text;
                    if(_formkey.currentState!.validate()) {
                      Firestore.addProduct(name: name,price: price,detail: detail);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(),));
                 //  print('hai');
                    }
                    },
                  child: Text(
                    'save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
