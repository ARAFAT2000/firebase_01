import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cloud_add_screen.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final storage= FirebaseFirestore.instance.collection('Teacher').snapshots();
  final storagenew= FirebaseFirestore.instance.collection('Teacher');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ColudAddScreen()));
      },child: Icon(Icons.add),),
       body: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children: [
             SizedBox(
               height: 30,
             ),
             StreamBuilder(
                 stream: storage,
                 builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){

                   return SingleChildScrollView(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: snapshot.data!.docs.length,
                         itemBuilder: (context,index){
                           var dynamicvalue= snapshot.data!.docs[index];
                           return ListTile(
                             title: Text(dynamicvalue['title']),
                            subtitle: Text(dynamicvalue['Desc']),
                             trailing: InkWell(
                                 onTap: (){
                                   storagenew.doc(dynamicvalue['title'].toString()).delete();
                                 },
                                 child: Icon(Icons.delete)),
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
