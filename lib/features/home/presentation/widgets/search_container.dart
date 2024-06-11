import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';
import 'package:my_weather/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:my_weather/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:my_weather/features/home/presentation/widgets/searched_item.dart';

class SearchContainer extends StatelessWidget {
  SearchContainer({super.key});
  //final formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  final AppPreferences appPreferences = instance();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500.h,
        color: ColorManager.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: GestureDetector(
                  onTapDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
                  onTap: () {
                    BlocProvider.of<SearchBloc>(context).add(SearchDoneEvent());
                    /*context.read<SearchBloc>().add(const SearchDoneEvent());*/
                    /*context
                        .read<HomeBloc>()
                        .add(const GetWeatherByLocationEvent());*/
                        
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: ColorManager.lightBlack)),
                    child: Text(
                      'X',
                      style: TextStyles.font14LightBlack400,
                    ),
                  ),
                ),
              ),
            ),
            Form(
              //key: formKey,
              child: TextFormField(
                style: TextStyles.font12LightBlack300,
                autofocus: true,
                controller: searchController,
                onChanged: (value) {
                  if (value.length > 2) {
                    appPreferences.setSearchText(value);
                    context.read<SearchBloc>().add(SearchOnChangeEvent(value));
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: PopupMenuButton<String>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'location',
                        // row with 2 children
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 4,
                          minLeadingWidth: 25,
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: ColorManager.gradientColor1,
                          ),
                          title: Text(
                            "Current Location",
                            style: TextStyles.font12LightBlack300,
                          ),
                        ),
                      )
                    ],
                    elevation: 2,
                    onSelected: (value) {
                      context.read<SearchBloc>().add(SearchDoneEvent());
                      context
                          .read<HomeBloc>()
                          .add(const GetWeatherByLocationEvent());
                    },
                    icon: const Icon(Icons.add),
                  ),
                  prefixIconColor: ColorManager.gradientColor1,
                  hintText: 'Search a city weather',
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              if (state is SearchLoadingState) {
                return SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is SearchSuccessState) {
                if (state.searchList!.isNotEmpty) {
                  return Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: ListView(
                      children: [
                        ...state.searchList!.map((city) =>
                            searchedItem(city, context, searchController))
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No Results'));
                }
              } else if (state is SearchFailureState) {
                return Text(state.message);
              } else if (state is SearchDoneState) {
                return const SizedBox.shrink();
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
