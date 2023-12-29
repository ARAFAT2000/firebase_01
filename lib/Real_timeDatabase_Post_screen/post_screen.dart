
import 'package:firebase_01/UI/Auth/log_in_screen.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_post_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post Screen'),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
            }).onError((error, stackTrace) {
              Utils().toastmessege(error.toString());
            });
          },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPostScreen()));
        },
        child: Icon(Icons.add),),

    );
  }
}
