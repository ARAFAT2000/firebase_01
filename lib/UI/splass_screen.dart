import 'package:flutter/material.dart';

import '../Firebase_services/splass_servces.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  SplassService _splassService =SplassService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splassService.isLogIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child: Text('FireBase Splass Screen',style: TextStyle(
         fontSize: 25
       ),),),
    );
  }
}
