import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/screen1.dart';
import 'package:firebase/screens/update.dart';
import 'package:firebase/service/firestoreservices.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products and Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('product')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('there is no data'),
                    );
                  }
                  return ListView(
                      children: snapshot.data!.docs.map((document) {
                    // print(document.id);
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name : ${document['name']}'),
                            Text('Price :${document['price']}'),
                            Text('Details :${document['detail']}'),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(100, 50))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateData(
                                            productId: document.id,
                                            currentName: document['name'],
                                            currentPrice: document['price'],
                                            currentDetail: document['detail'],
                                          ),
                                        ));
                                  },
                                  child: Text('Update'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(
                                          Size(100, 50))),
                                  onPressed: () {
                                    firestoreService()
                                        .deleteProduct(id: document.id);
                                  },
                                  child: Text('delete'),
                                ),
                              ],
                            ),
                          ]),
                    );
                  }).toList());
                }),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen1(),
                    ));
              },
              child: const Text('Add product')),
        ],
      ),
    );
  }
}
