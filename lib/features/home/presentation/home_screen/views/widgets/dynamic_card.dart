import 'package:flutter/material.dart';

class DynamicCard extends StatelessWidget {
  final String title;
  final String data;
  const DynamicCard({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const Spacer(),
              Text(data)
            ],
          ),
        ));
  }
}
