import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final String imageUrl;

  const OrderItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'x$quantity',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
