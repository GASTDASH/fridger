import 'package:flutter/material.dart';
import 'package:fridger/repositories/products/models/models.dart';
import 'package:fridger/ui/ui.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({
    super.key,
  });

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  final nameTextController = TextEditingController();
  final weightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Container(
          decoration: BoxDecoration(
            color: theme.canvasColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 24),
                child: Column(
                  children: [
                    Text(
                      "Новый продукт",
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 24),
                    TextBox(
                      title: "Название",
                      hintText: "Банан",
                      keyboardType: TextInputType.name,
                      controller: nameTextController,
                    ),
                    TextBox(
                      title: "Вес (в граммах)",
                      hintText: "1200",
                      keyboardType: TextInputType.number,
                      controller: weightTextController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Отмена"),
                      ),
                      FilledButton.icon(
                        onPressed: () async {
                          try {
                            final String name = nameTextController.text;
                            final int weight =
                                int.parse(weightTextController.text);

                            final Product product = Product(
                              id: UniqueKey().hashCode,
                              name: name,
                              weight: weight,
                            );

                            Navigator.pop(context, product);
                          } on FormatException catch (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red.shade600,
                                showCloseIcon: true,
                                content: const Text("Неправильно указан вес"),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red.shade600,
                                showCloseIcon: true,
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                        label: const Text("Создать"),
                        icon: const Icon(Icons.create),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
