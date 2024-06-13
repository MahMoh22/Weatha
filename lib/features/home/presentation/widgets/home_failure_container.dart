import 'package:flutter/material.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/widgets/search_container.dart';

class HomeFailureContainer extends StatelessWidget {
  const HomeFailureContainer({
    super.key,
    required this.state,
    required this.isSearch,
  });
  final HomeFailureState state;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
        child: Center(
          child: Text(state.message),
        ),
      ),
      isSearch ? SearchContainer() : const SizedBox.shrink(),
    ]);
  }
}
