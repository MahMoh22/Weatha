import 'package:flutter/material.dart';

class HomeLoadingContainer extends StatelessWidget {
  const HomeLoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
          ),
        ),
        child: const Center(child: CircularProgressIndicator()));
  }
}
