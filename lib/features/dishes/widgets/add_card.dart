import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.add_rounded, size: 64),
        ),
      ),
    );
  }
}
