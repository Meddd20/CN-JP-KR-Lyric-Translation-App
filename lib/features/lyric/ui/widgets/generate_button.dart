import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isLoading;

  const GenerateButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    "Generate",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
          ),
        ),
      ),
    );
  }
}
