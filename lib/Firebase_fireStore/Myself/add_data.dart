import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MySelfAddData extends StatefulWidget {
  const MySelfAddData({super.key});

  @override
  State<MySelfAddData> createState() => _MySelfAddDataState();
}

class _MySelfAddDataState extends State<MySelfAddData> {
  final emailController= TextEditingController();
  final yourselfController= TextEditingController();
  final fireStore= FirebaseFirestore.instance.collection('ID 1');
  final Stream<QuerySnapshot> fetchdata= FirebaseFirestore.instance.collection('ID 1').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Self'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      TextFormField(
                        controller:emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter email ',
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: yourselfController,
                        decoration: InputDecoration(
                            hintText: 'Enter Yourself ',
                            border: OutlineInputBorder()
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: (){
                           fireStore.add({
                             'email':emailController.text.toString(),
                             'Mind': yourselfController.text.toString()
                           });
                          },
                          child: Text('Submit Data'))
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                  stream: fetchdata,
                  builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                    return !snapshot.hasData?Text('Loading'):
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            var docData =snapshot.data!.docs[index];
                           return ListTile(
                             title:  Text(docData['Mind']),
                             subtitle: Text(docData!['email']) ,
                           );
                          }),
                    );
                  })
            ],
          )),
    );
  }
}
