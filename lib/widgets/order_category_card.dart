import 'package:flutter/material.dart';

class OrderCategoryCard extends StatelessWidget {
  const OrderCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: const [],
    );
  }
}
