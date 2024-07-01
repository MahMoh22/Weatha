import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/spacing.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/widgets/search_container.dart';

class HomeFailureContainer extends StatelessWidget {
  HomeFailureContainer({
    super.key,
    required this.state,
    required this.isSearch,
  });
  final HomeFailureState state;
  final bool isSearch;
  final AppPreferences appPreferences = instance<AppPreferences>();

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
          child: Text(state.message, textAlign: TextAlign.center), 
        ),
      ),
      verticalSpace(20.h),
      Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Center(
          child: IconButton(
            onPressed: () {
              if (appPreferences.getLat().isNotEmpty &&
                  appPreferences.getLong().isNotEmpty) {
                context.read<HomeBloc>().add(const GetWeatherByLocationEvent());
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Please Enable Location First!, Or Search A City')));
              }
            },
            icon: Icon(
              Icons.replay,
              size: 20.w,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
        ),
      ),
      isSearch ? SearchContainer() : const SizedBox.shrink(),
    ]);
  }
}
