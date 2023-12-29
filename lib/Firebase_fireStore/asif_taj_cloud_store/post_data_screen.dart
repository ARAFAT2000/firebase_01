import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:flutter/material.dart';

class AsifTajCloud extends StatefulWidget {
  const AsifTajCloud({super.key});

  @override
  State<AsifTajCloud> createState() => _AsifTajCloudState();
}

class _AsifTajCloudState extends State<AsifTajCloud> {
  TextEditingController titleController= TextEditingController();
  TextEditingController detailsController=TextEditingController();
  final firestore= FirebaseFirestore.instance.collection('Honesty');

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Asif taj Firebase FireStore'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              child: Column(
                children: [
                  TextFormField(
                    controller:titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: detailsController,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   ElevatedButton(onPressed: (){
                     var id= DateTime.now().toString();
                     firestore.doc(id).set({
                      'title':titleController.text.toString(),
                       'id':id
                     })
                         .then((value) {
                       Utils().toastmessege('Add data');
                     }).onError((error, stackTrace) {
                        Utils().toastmessege(error.toString());
                     });
                   },
                       child:Text('Submit data'))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
