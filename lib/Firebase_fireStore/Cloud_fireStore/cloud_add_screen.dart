import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_01/Widget/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ColudAddScreen extends StatefulWidget {
  const ColudAddScreen({super.key});

  @override
  State<ColudAddScreen> createState() => _ColudAddScreenState();
}

class _ColudAddScreenState extends State<ColudAddScreen> {
  TextEditingController adddatacontroller= TextEditingController();
  TextEditingController dataController= TextEditingController();

  final postStore= FirebaseFirestore.instance.collection('Teacher');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Data'),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(
          children: [
            TextFormField(
              controller: adddatacontroller,
              decoration: InputDecoration(
                  hintText: 'Add Data ',
                  border: OutlineInputBorder()
              ),

            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: dataController,
              decoration: InputDecoration(
                  hintText: 'Add description',
                  border: OutlineInputBorder()
              ),

            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(

                title: 'Add',
                onTap:(){
                  postStore.add({
                    'title':adddatacontroller.text,
                    'Desc':dataController.text
                  });

                }
            )
          ],
        ),
      ),
    );
  }
}
