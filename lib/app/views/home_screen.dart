import 'package:flutter/material.dart';
import '../widgets/date_picker_card.dart';
import '../widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NASA Image', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [DatePickerCard(), SizedBox(height: 16), ImageCard()],
        ),
      ),
    );
  }
}
