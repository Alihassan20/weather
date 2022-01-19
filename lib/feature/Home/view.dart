import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/style.dart';
import 'package:weather/feature/Home/states.dart';

import 'cubit.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<HomeCubit, HomeStats>(
            builder: (context, state) {
              final cubit = HomeCubit.of(context);
              final weather = cubit.weather;
              return state is HomeLoading ? const Center(child: CircularProgressIndicator()) : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('"temperature"  ${weather!.main!.temp!}',style: kstyle(context, 20, Colors.redAccent),),
                  Text(weather.weather!.first.main!,style: kstyle(context, 20, Colors.black)),
                  Text(weather.weather!.first.description!,style: kstyle(context, 20, Colors.black54)),
                  Text(weather.name!,style: kstyle(context, 20, Colors.blueAccent)),
                  Text('"country"  ${weather.sys!.country!}',style: kstyle(context, 20, Colors.blueAccent)),
                  Text('"sunrise"  ${
                      DateTime.fromMillisecondsSinceEpoch(
                          weather.sys!.sunrise!)
                  }',style: kstyle(context, 20, Colors.black45)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

