import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/extentions.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:my_weather/features/home/presentation/pages/today_view.dart';
import 'package:my_weather/features/home/presentation/widgets/home_failure_container.dart';
import 'package:my_weather/features/home/presentation/widgets/home_loading_container.dart';
import 'package:my_weather/features/home/presentation/widgets/search_container.dart';
import 'package:my_weather/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:my_weather/features/settings/presentation/widgets/settings_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppPreferences appPreferences = instance();
  final PageController _pageController = PageController();
  bool isSearch = false;
  int currentIndex = 0;
  @override
  void initState() {
    if (appPreferences.getTheme() == 'dark') {
      context.read<SettingsBloc>().add(DarkThemeEvent());
    } else if (appPreferences.getTheme() == 'light') {
      context.read<SettingsBloc>().add(LightThemeEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          onPressed: () {
            isSearch = true;
            setState(() {});
            context.read<SearchBloc>().add(ResetStateEvent());
          },
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.scrim,
            weight: 40.w,
            size: 28.w,
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
                child: _getProperCercle(i, currentIndex, context),
              )
          ],
        ),
        actions: const [
          SettingsButton(),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchDoneState) {
                isSearch = false;
                setState(() {});
              }
            },
          ),
          BlocListener<SettingsBloc, SettingsState>(listener: (context, state) {
            if (state is SettingsUnitsSuccessState) {
              setState(() {});
            }
          }),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const HomeLoadingContainer();
            } else if (state is HomeFailureState) {
              return HomeFailureContainer(state: state, isSearch: isSearch);
            } else if (state is HomeSuccessState) {
              return homeSuccessContainer(state);
            } else {
              return Center(
                child: Text("something_went_wrong".tr(context)),
              );
            }
          },
        ),
      ),
    );
  }

  Stack homeSuccessContainer(HomeSuccessState state) {
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
  }
}

Widget _getProperCercle(int index, currentIndex, BuildContext context) {
  if (currentIndex == index) {
    return _dot(32, Theme.of(context).colorScheme.scrim);
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
