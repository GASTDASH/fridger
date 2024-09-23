import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fridger/repositories/dishes/custom_dishes_interface.dart';
import 'package:fridger/repositories/dishes/models/custom_dish.dart';
import 'package:fridger/repositories/products/products.dart';

class CustomDishesFirebase implements CustomDishesInterface {
  @override
  Future<List<CustomDish>> getDishes() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("dishes").get();

    // GetIt.I<Talker>()
    // .debug(snapshot.docs.map((doc) => doc.data()["date_create"]));

    final docs = snapshot.docs
        .map(
          (doc) => CustomDish(
            id: UniqueKey().hashCode,
            name: doc.data()["name"],
            products: (doc.data()["products"] as List)
                .map(
                  (product) => Product(
                    id: UniqueKey().hashCode,
                    name: product,
                    weight: 0,
                  ),
                )
                .toList(),
            description: doc.data()["description"],
            username: doc.data()["username"],
            dateCreate: DateTime.fromMicrosecondsSinceEpoch(
                (doc.data()["date_create"] as Timestamp)
                    .microsecondsSinceEpoch),
          ),
        )
        .toList();

    return docs;
  }
}
