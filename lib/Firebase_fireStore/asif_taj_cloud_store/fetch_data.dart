import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_01/Firebase_fireStore/asif_taj_cloud_store/post_data_screen.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class AsifTajFetch extends StatefulWidget {

  const AsifTajFetch({super.key});

  @override
  State<AsifTajFetch> createState() => _AsifTajFetchState();
}

class _AsifTajFetchState extends State<AsifTajFetch> {

  final fetchData= FirebaseFirestore.instance.collection('Honesty').snapshots();
  final firestore1= FirebaseFirestore.instance.collection('Honesty');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('Fetch data '),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>AsifTajCloud()));
      },child: Icon(Icons.add),),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StreamBuilder(
                stream: fetchData,
                builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                 return !snapshot.hasData? Center(child: CircularProgressIndicator(),):
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          var getStore= snapshot.data!.docs[index];
                          return ListTile(
                            subtitle: Text(getStore['id']),
                            title: Text(getStore['title']),
                            trailing: InkWell(
                                onTap: (){
                                  // firestore1.doc(snapshot.data!.docs[index]['title'].toString()).update(
                                  //     {
                                  //       'title':'I love you ',
                                  //       'id':''
                                  //     }).then((value) {
                                  //       Utils().toastmessege('Updated');
                                  // }).onError((error, stackTrace) {
                                  //   Utils().toastmessege(error.toString());
                                  // });
                                 firestore1.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                },
                                child: Icon(Icons.update)),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
