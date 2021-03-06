import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/style.dart';
import 'package:weather/feature/Home/states.dart';

import '../../core/Routes/routes.dart';
import '../search/view.dart';
import 'cubit.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => MagicRouter.navigateTo(SearchView()),
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<HomeCubit, HomeStats>(
            builder: (context, state) {
              final cubit = HomeCubit.of(context);
              final weather = cubit.weather;
              return state is HomeLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(weather!.main!.temp!.toString(),
                            style: Theme.of(context).textTheme.headline5),
                        Text(weather.weather!.first.main!,
                            style: Theme.of(context).textTheme.headline5),
                        Text(weather.name!,
                            style: Theme.of(context).textTheme.headline5),
                        Text(weather.sys!.country!,
                            style: Theme.of(context).textTheme.headline5),
                        Text(
                            DateTime.fromMillisecondsSinceEpoch(
                                    weather.sys!.sunrise!)
                                .toString(),
                            style: Theme.of(context).textTheme.headline5),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
