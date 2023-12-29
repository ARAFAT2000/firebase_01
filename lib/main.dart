

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'Firebase_fireStore/Cloud_fireStore/cloud_add_screen.dart';
import 'Firebase_fireStore/Cloud_fireStore/show-data.dart';
import 'Firebase_fireStore/Myself/add_data.dart';
import 'Firebase_fireStore/asif_taj_cloud_store/fetch_data.dart';
import 'Firebase_fireStore/asif_taj_cloud_store/post_data_screen.dart';
import 'Real_timeDatabase_Post_screen/add_post_screen.dart';
import 'Upload_images/upload_images.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: UploadImages(),
    );
  }
}

