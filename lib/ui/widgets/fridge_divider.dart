import 'package:flutter/material.dart';

class FridgeDivider extends StatelessWidget {
  const FridgeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 10,
      decoration: BoxDecoration(
        color: theme.dividerTheme.color,
      ),
    );
  }
}
