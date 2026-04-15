import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final void Function(String) onChanged;
  final void Function(PointerDownEvent) onTapOutside;
  final void Function() onDeleteText;

  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.hintText,
    required this.onChanged,
    required this.onTapOutside,
    required this.onDeleteText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.surface,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Icon(
            Icons.search,
            color: AppColors.textMuted,
          ),
        ),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                onPressed: onDeleteText,
                icon: const Icon(Icons.clear, color: AppColors.textMuted),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
