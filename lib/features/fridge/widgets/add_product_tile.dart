import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridger/features/fridge/bloc/fridge_bloc.dart';
import 'package:fridger/repositories/products/models/models.dart';
import 'package:fridger/ui/widgets/widgets.dart';

class AddProductTile extends StatelessWidget {
  const AddProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 6, right: 20),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<FridgeBloc>(context).add(FridgeAddProduct(
                    product: Product(
                        id: UniqueKey().hashCode, name: "test", weight: 120)));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    "assets/icons/add.svg",
                    height: 30,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Добавить",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        const FridgeDivider(),
      ],
    );
  }
}
