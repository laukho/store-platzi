import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // récupérer la catégorie stockée dans le provider
    inspect(context.watch<CategoryProvider>().category);

    return const Placeholder();
  }
}
