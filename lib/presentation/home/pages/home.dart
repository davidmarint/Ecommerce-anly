import 'package:ecommerce_anly/presentation/home/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(child: Column(
      children: [
        Header(),
      ],
           )),
    );
  }
}