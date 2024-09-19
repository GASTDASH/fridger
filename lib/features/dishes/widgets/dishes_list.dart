import 'package:flutter/material.dart';

class DishesList extends StatelessWidget {
  const DishesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 200,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF98A8B8),
                      image: const DecorationImage(
                          image:
                              NetworkImage("https://i.imgur.com/e5cQso8.jpeg"),
                          fit: BoxFit.cover),
                    ),
                    height: 120,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Название", style: theme.textTheme.titleMedium),
                          Flexible(
                            child: Text(
                              "Состав: продукт, продукт, продукт, продукт, продукт, продукт, продукт",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: theme.hintColor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
