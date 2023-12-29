


import 'package:firebase_01/Widget/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading=false;


  TextEditingController adddatacontroller= TextEditingController();
  TextEditingController addcitycontroller= TextEditingController();

  final refDataInstance = FirebaseDatabase.instance.ref().child('users');

 String ?data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Post'),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
             onChanged: (value){
               data=value;
             },
              decoration: InputDecoration(
                  hintText: 'What is your mind',
                  border: OutlineInputBorder()
              ),

            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: addcitycontroller,
              decoration: InputDecoration(
                  hintText: 'City',
                  border: OutlineInputBorder()
              ),

            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(

                title: 'Add',
                onTap: () {

                  Add();
                }
            )
          ],
        ),
      ),
    );
  }
  void Add(){

    refDataInstance.push().child('data').set({

    }).asStream();

  }


}
