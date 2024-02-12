import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planner_app/src/core/utils/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({required this.hintText, this.onChanged, super.key});

  final String hintText;
  final void Function(String)? onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.onChanged!(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
      child: TextField(
        controller: searchController,
        onChanged: _onSearchChanged,
        onTapOutside: (event) {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
