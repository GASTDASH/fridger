import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridger/features/fridge/bloc/fridge_bloc.dart';
import 'package:fridger/features/fridge/widgets/add_product_bottom_sheet.dart';
import 'package:fridger/ui/ui.dart';

class AddProductTile extends StatelessWidget {
  const AddProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final fridgeBloc = BlocProvider.of<FridgeBloc>(context);

            final product = await _onTapAdd(context);
            if (product != null) {
              fridgeBloc.add(FridgeAddProduct(product: product));
            }
          },
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 6, right: 20),
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

  Future<dynamic> _onTapAdd(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return const AddProductBottomSheet();
      },
    );
  }
}
