import 'package:flutter/material.dart';

import 'package:cat_breed/core/widgets/textfield.dart';
import 'package:cat_breed/features/cat_breeds/presentation/widgets/clear_button.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
    required this.onInputChanged,
    required this.onClear,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onInputChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return UITextField(
      placeholder: 'Search breeds',
      controller: searchController,
      onChanged: onInputChanged,
      suffix: ValueListenableBuilder<TextEditingValue>(
        valueListenable: searchController,
        builder: (context, value, child) {
          if (value.text.isEmpty) {
            return const SizedBox.shrink();
          }
          return UIIconButton(
            onPressed: () {
              searchController.clear();
              onClear();
            },
          );
        },
      ),
    );
  }
}
