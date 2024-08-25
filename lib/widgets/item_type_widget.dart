import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/alimentos.webp",
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: 8,
          ),
          Text("Alimentos"),
        ],
      ),
    );
  }
}
