import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final String fullName;
  final String email;
  final String address;

  ListData({
    required this.fullName,
    required this.email,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Personal Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity, // Set width to occupy available space
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfo('', fullName),
                buildInfo('', email),
                buildInfo('', address),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 3.0),
        Text(
          value,
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(height: 3.0),
      ],
    );
  }
}
