import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';
import 'package:my_weather/features/home/domain/entities/search.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';

Widget searchedItem(
    Search placeItem, context, TextEditingController textEditingController) {
  final AppPreferences appPreferences = instance();

  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTapDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: () async {
        appPreferences.setName(
            '${placeItem.name} ${placeItem.region} ${placeItem.country}');
        BlocProvider.of<SearchBloc>(context).add(SearchDoneEvent());
        BlocProvider.of<HomeBloc>(context).add(const GetWeatherByNameEvent());
        textEditingController.text =
            '${placeItem.name} ${placeItem.region} ${placeItem.country}';
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.location_on,
              color: ColorManager.gradientColor1, size: 25.0),
          const SizedBox(width: 4.0),
          SizedBox(
            //height: 40.0,
            width: MediaQuery.of(context).size.width - 100.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${placeItem.name} ${placeItem.region} ${placeItem.country}',
                style: TextStyles.font12LightBlack300,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
