import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/constants/constants.dart';
import 'package:weather_prediction/repositories/weather_repository.dart';

import '../app_cubit/app_cubit.dart';
import '../pages/home_page/cubit/home_page_cubit.dart';
import '../pages/search_city/cubit /search_city_cubit.dart';
import '../pages/search_city/page/search_city_page.dart';
import '../theme /theme.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  AppCubit get _cubit => context.read<AppCubit>();
  HomePageCubit get _homeCubit => context.read<HomePageCubit>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 25,
      title: _buildTitleWidget(
        context,
        Constants.appNameText,
      ),
      leading: _buildRefreshButtonWidget(context),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            icon: const Icon(
              size: 30,
              Icons.location_city,
              color: Colors.white,
            ),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepositoryProvider<WeatherRepository>(
                    create: (context) => WeatherRepositoryImpl(),
                    child: BlocProvider<SearchCityCubit>(
                      create: (context) => SearchCityCubit(context: context),
                      child: const SearchCityPage(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTitleWidget(
    BuildContext context,
    String title,
  ) {
    return TextButton(
      onPressed: () => _cubit.toggleTheme(),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTheme.createWhiteTextStyle(
          30,
          bold: true,
        ),
      ),
    );
  }

  Widget _buildRefreshButtonWidget(BuildContext context) {
    return IconButton(
      icon: const Icon(
        size: 30,
        Icons.refresh,
        color: Colors.white,
      ),
      color: Colors.black,
      onPressed: () => _homeCubit.getWeather(),
    );
  }
}
