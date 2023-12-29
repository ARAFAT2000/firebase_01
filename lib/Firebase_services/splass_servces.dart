import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Real_timeDatabase_Post_screen/post_screen.dart';
import '../UI/Auth/log_in_screen.dart';
class SplassService{
  void isLogIn(BuildContext context){
    final _auth=FirebaseAuth.instance;
    final user= _auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3), () {

        Navigator.push(context,MaterialPageRoute(builder: (context)=>PostScreen()));
      });
    }else{
      Timer(Duration(seconds: 3), () {

        Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
      });
    }
    }


}