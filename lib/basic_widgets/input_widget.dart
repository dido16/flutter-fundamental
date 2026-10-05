import 'package:flutter/material.dart';

class MyInputWidget extends StatelessWidget {
  const MyInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nama Lengkap',
        ),
      ),
    );
  }
}