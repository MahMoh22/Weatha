import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/core/helper/extentions.dart';
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
        color: Theme.of(context).colorScheme.secondary,
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
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.scrim)),
                    child: Text(
                      'X',
                      style: TextStyles.font14LightBlack400
                          .copyWith(color: Theme.of(context).colorScheme.scrim),
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
                cursorColor: Theme.of(context).colorScheme.scrim,
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
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(
                            "current_location".tr(context),
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
                  prefixIconColor: Theme.of(context).colorScheme.primary,
                  hintText: 'Search_a_city_weather'.tr(context),
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
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: ListView(
                      children: [
                        ...state.searchList!.map((city) =>
                            searchedItem(city, context, searchController))
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No_Results'.tr(context)));
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
