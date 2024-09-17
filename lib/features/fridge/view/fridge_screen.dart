import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridger/features/fridge/bloc/fridge_bloc.dart';
import 'package:fridger/features/fridge/widgets/widgets.dart';

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({
    super.key,
  });

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  final _fridgeBloc = FridgeBloc();

  @override
  void initState() {
    super.initState();

    loadProducts();
  }

  void loadProducts() {
    _fridgeBloc.add(FridgeLoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Холодильник",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Блюда",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Настройки",
          ),
        ],
      ),
      body: BlocBuilder<FridgeBloc, FridgeState>(
        bloc: _fridgeBloc,
        builder: (context, state) {
          if (state is FridgeLoaded) {
            return RefreshIndicator(
              onRefresh: () {
                return Future(() {
                  loadProducts();
                });
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: Text(
                      "Холодильник",
                      style: theme.textTheme.headlineLarge
                          ?.copyWith(color: theme.hintColor),
                    ),
                    elevation: 2,
                    shadowColor: Colors.black,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        "Наличие продуктов:",
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(color: theme.hintColor),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(bottom: 24),
                    sliver: ProductList(
                      productsList: state.productsList,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is FridgeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FridgeFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: theme.textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    state.error.toString(),
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  const Icon(
                    Icons.warning_amber,
                    size: 80,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Error",
                  style: theme.textTheme.displayMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "Unexpected state",
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                const Icon(
                  Icons.warning_amber,
                  size: 80,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// TODO: Local Storage
// TODO: JSON ser....
// TODO: AutoRouter
