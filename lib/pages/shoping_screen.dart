import 'package:flutter/material.dart';
import 'package:pml/data/barang.dart';
import 'package:pml/widget/item_barang_widget.dart'; 

class ShopingScreen extends StatelessWidget {
  const ShopingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        backgroundColor: const Color.fromARGB(255, 24, 133, 217),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: list_barang.length,
          itemBuilder: (context, index) {
            final barang = list_barang[index];
            
            //fungsi untuk panggil widget kirimkan data barang
            return ItemBarangWidget(barang: barang);
          },
        ),
      ),
    );
  }
}