import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:my_weather/features/home/presentation/pages/today_view.dart';
import 'package:my_weather/features/home/presentation/widgets/search_container.dart';
import 'package:my_weather/features/settings/presentation/widgets/lang.dart';
import 'package:my_weather/features/settings/presentation/widgets/mode.dart';
import 'package:my_weather/features/settings/presentation/widgets/units.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.gradientColor2,
        leading: IconButton(
          onPressed: () {
            isSearch = true;
            setState(() {});
            context.read<SearchBloc>().add(ResetStateEvent());
          },
          icon: SvgPicture.asset(
            'assets/images/searchIc.svg',
            width: 20.w,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.all(4),
                child: _getProperCercle(i, currentIndex),
              )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: PopupMenuButton<String>(
              
              itemBuilder: (context) => [
                /////////////// mode
                const PopupMenuItem(value: 'mode', child: AppMode()
                    // row with 2 children
                    /*ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 4,
                          minLeadingWidth: 25,
                          leading: const Icon(
                            Icons.wb_sunny_outlined,
                            color: ColorManager.lightBlack,
                          ),
                          title: Text(
                            "App Mode",
                            style: TextStyles.font12LightBlack300,
                          ),
                        ),*/
                    ),
                ///////////////
                /////////////// unit
                const PopupMenuItem(value: 'Unit', child: AppUnits()
                    // row with 2 children
                    /*ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 4,
                          minLeadingWidth: 25,
                          leading: const Icon(
                            Icons.ac_unit,
                            color: ColorManager.lightBlack,
                          ),
                          title: Text(
                            "Units",
                            style: TextStyles.font12LightBlack300,
                          ),
                        ),*/
                    ),
                ///////////////
                /////////////// lang
                const PopupMenuItem(value: 'lang', child: AppLang()
                    // row with 2 children
                    /*ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 4,
                          minLeadingWidth: 25,
                          leading: const Icon(
                            Icons.language,
                            color: ColorManager.lightBlack,
                          ),
                          title: Text(
                            "Language",
                            style: TextStyles.font12LightBlack300,
                          ),
                        ),*/
                    ),
                ///////////////
              ],
              elevation: 2,
              onSelected: (value) {
                context.read<SearchBloc>().add(SearchDoneEvent());
                context.read<HomeBloc>().add(const GetWeatherByLocationEvent());
              },
              icon: const Icon(Icons.settings, color: ColorManager.lightBlack),
            ),
          ),
        ],
      ),
      body: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchDoneState) {
            isSearch = false;
            setState(() {});
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: ColorManager.gradientBackgroundColor,
                  ),
                  child: const Center(child: CircularProgressIndicator()));
            } else if (state is HomeFailureState) {
              return Stack(children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: ColorManager.gradientBackgroundColor,
                  ),
                  child: Center(
                    child: Text(state.message),
                  ),
                ),
                isSearch ? SearchContainer() : const SizedBox.shrink(),
              ]);
            } else if (state is HomeSuccessState) {
              return Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return TodayView(
                        weather: state.weather,
                        index: index,
                      );
                    },
                  ),
                  isSearch ? SearchContainer() : const SizedBox.shrink(),
                ],
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _getProperCercle(int index, currentIndex) {
  if (currentIndex == index) {
    return _dot(32, ColorManager.lightBlack);
  } else {
    return _dot(8, ColorManager.grey);
  }
}

Widget _dot(double width, Color color) {
  return Container(
    height: 8,
    width: width,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
  );
}
