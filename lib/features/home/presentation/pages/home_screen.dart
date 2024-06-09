import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/pages/today_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.gradientColor2,
        leading: IconButton(
          onPressed: () {},
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
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailureState) {
            return Center(child: Text(state.message));
          } else if (state is HomeSuccessState) {
            return PageView.builder(
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
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}

Widget _getProperCercle(int index, currentIndex) {
  if (currentIndex == index) {
    return _dot(24, ColorManager.lightBlack);
  } else {
    return _dot(6, ColorManager.grey);
  }
}

Widget _dot(double width, Color color) {
  return Container(
    height: 6,
    width: width,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
  );
}
