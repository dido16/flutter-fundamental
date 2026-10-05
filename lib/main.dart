import 'package:flutter/material.dart';
import 'package:pml/basic_widgets/image_widget.dart';
import 'package:pml/basic_widgets/text_widget.dart';
import 'package:pml/basic_widgets/input_widget.dart';
import 'package:pml/basic_widgets/date_picker_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifikasi'),
          content: const Text('Ini adalah pop up dialog dari Floating Action Button.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const MyTextWidget(),
              const SizedBox(height: 16),

              const MyImageWidget(),
              const SizedBox(height: 20),

              const MyInputWidget(),
              const SizedBox(height: 20),

              const MyDatePickerWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Show Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }
}