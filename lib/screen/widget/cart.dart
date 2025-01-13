import 'package:flutter/material.dart';
import 'package:lotuspmc/service/style/color.dart';

class CartContainer extends StatelessWidget {
  final String label;
  final String image;
  const CartContainer({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 3,
          child: Stack(
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Icon(
              //     Icons.search,
              //     color: secondary,
              //     size: 30,
              //   ),
              // ).paddingAll(5),
              SizedBox(
                height: 140,
                child: Center(
                  child: Image.network(
                    "http://sahedstar.xyz/$image",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: secondary,
          ),
        ),
      ],
    );
  }
}

class FullImageView extends StatelessWidget {
  final String title;
  final String imagerUrl;
  const FullImageView(
      {super.key, required this.imagerUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Image.network(
          "http://sahedstar.xyz/$imagerUrl",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
