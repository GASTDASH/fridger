import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CookTypeFooter extends StatefulWidget {
  const CookTypeFooter({
    super.key,
  });

  @override
  State<CookTypeFooter> createState() => _CookTypeFooterState();
}

class _CookTypeFooterState extends State<CookTypeFooter> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Text(
              "Как-бы вы это хотели приготовить?",
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/oven.svg",
                    width: 45,
                    colorFilter: ColorFilter.mode(
                      theme.hintColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  tooltip: "Печь",
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/fry.svg",
                    width: 60,
                    colorFilter: ColorFilter.mode(
                      theme.hintColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  tooltip: "Жарить",
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/steam.svg",
                    width: 50,
                    colorFilter: ColorFilter.mode(
                      theme.hintColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  tooltip: "Варить",
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.egg,
                    color: theme.hintColor,
                    size: 45,
                  ),
                  tooltip: "Сырое",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
