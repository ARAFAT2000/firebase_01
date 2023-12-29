import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({super.key});

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  File ? images;
  final ImagePicker picker = ImagePicker();
  Future<void> GetImages()async{
    final picfiled=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
  setState(() {
    if(picfiled !=  null){
      images= File(picfiled.path);
    }else{
      print('No Images');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Upload Images'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: (){},
                child: Center(
                  child:images !=null? Image.file(images!.absolute) :Icon(Icons.image),
                ),
              ),
              
              SizedBox(height: 15,),
              TextButton(onPressed: (){}, child: Text('Data'))
            ],)),
    );
  }
}
