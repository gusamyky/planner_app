import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchField extends StatefulWidget {
  const SearchField({this.hintText, this.onChanged, super.key});

  final String? hintText;
  final void Function(String)? onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: _onSearchChanged,
      onTapOutside: (event) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText ?? AppLocalizations.of(context)!.search_hint,
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
