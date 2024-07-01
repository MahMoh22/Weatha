import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/features/settings/presentation/widgets/lang.dart';
import 'package:my_weather/features/settings/presentation/widgets/mode.dart';
import 'package:my_weather/features/settings/presentation/widgets/units.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: PopupMenuButton<String>(
        color: Colors.white54,
        itemBuilder: (context) => [
          // mode
          PopupMenuItem(value: 'mode', child: AppMode()),
          // unit
          PopupMenuItem(value: 'Unit', child: AppUnits()),
          // lang
          PopupMenuItem(value: 'lang', child: AppLang()),
        ],
        elevation: 2,
        onSelected: (value) {
          context.read<SearchBloc>().add(SearchDoneEvent());
          context.read<HomeBloc>().add(const GetWeatherByLocationEvent());
        },
        icon: Icon(Icons.settings,
            size: 20.w, color: Theme.of(context).colorScheme.scrim),
      ),
    );
  }
}
