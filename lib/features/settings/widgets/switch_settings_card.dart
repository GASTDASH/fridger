import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchSettingsCard extends StatefulWidget {
  const SwitchSettingsCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SwitchSettingsCard> createState() => _SwitchSettingsCardState();
}

class _SwitchSettingsCardState extends State<SwitchSettingsCard> {
  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: theme.textTheme.titleLarge),
          CupertinoSwitch(
              value: isToggle,
              onChanged: (value) {
                setState(() {
                  isToggle = value;
                });
              })
        ],
      ),
    );
  }
}
