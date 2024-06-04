import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/detail.dart';
import 'package:flutter/material.dart';

import '../service/firestoreservices.dart';

class UpdateData extends StatefulWidget {
  final String productId;
  final String currentName;
  final String currentPrice;
  final String currentDetail;
  const UpdateData({
    super.key,
    required this.productId,
    required this.currentName,
    required this.currentPrice,
    required this.currentDetail
  });

  @override
  State<UpdateData> createState() => _UpdateDataState();
}
class _UpdateDataState extends State<UpdateData> {
  final TextEditingController _pricecontroller =TextEditingController();
  final TextEditingController _namecontroller =TextEditingController();
  final TextEditingController _detailcontroller = TextEditingController();
  final _formkey =GlobalKey<FormState>();
  final firestoreService _firestoreService =firestoreService();
  @override
  void initState(){
    super.initState();
  _namecontroller.text=widget.currentName;
  _pricecontroller.text=widget.currentPrice;
  _detailcontroller.text=widget.currentDetail;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update  your product',
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
                      'Edit your product name :',
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
                      'Edit your product price :',
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
                  onPressed: () async {
                    String name =_namecontroller.text;
                    String price =_pricecontroller.text;
                    String detail =_detailcontroller.text;
                    if(_formkey.currentState!.validate()) {
                      await _firestoreService.updateProduct(
                         id: widget.productId,
                         name: _namecontroller.text,
                         price: _pricecontroller.text,
                         detail: _detailcontroller.text,
                        );
                      Navigator.pop(context);

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

