import 'package:flutter/material.dart';

class GoogleMapReviewScreen extends StatelessWidget {
  const GoogleMapReviewScreen({super.key});

  Widget _buildButton({required IconData icon, required String title}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(title, style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bangladesh"),
              Text("Negara Besar"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/bangladesh.jpg"),
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle(),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('41'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(icon: (Icons.phone), title: "Call"),
                  _buildButton(icon: (Icons.home), title: "Home"),
                  _buildButton(icon: (Icons.share), title: "Share"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("夕方のファミリーレストランです。お客さんはまだ少なく、店の中は静かでした。厨房のそば"),
            ),
          ],
        ),
      ),
    );
  }
}
