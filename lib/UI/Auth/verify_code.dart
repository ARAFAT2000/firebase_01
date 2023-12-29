import 'package:flutter/material.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  String varificationid;
   VerifyPhoneNumberScreen({super.key,required this.varificationid});

  @override
  State<VerifyPhoneNumberScreen> createState() => _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in With phone'),
      ),
    );
  }
}
