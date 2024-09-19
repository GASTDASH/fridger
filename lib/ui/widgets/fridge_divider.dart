import 'package:flutter/material.dart';

class FridgeDivider extends StatelessWidget {
  const FridgeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: theme.dividerTheme.color,
        // gradient: LinearGradient(
        //   colors: [theme.dividerTheme.color!, Colors.white],
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        // ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-3, 3),
            blurRadius: 4,
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }
}
