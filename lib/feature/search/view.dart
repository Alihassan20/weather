import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/search/search__cubit.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Builder(
                  builder: (context) {
                    final cubit = SearchCubit.of(context);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: TextField(
                        decoration:InputDecoration(
                            hintText: 'Select Any City',
                            border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),

                        onSubmitted: cubit.search,
                      ),
                    );
                  }
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final cubit = SearchCubit.of(context);
                  if(state is SearchLoading){
                    return const Center(child: const CircularProgressIndicator());
                  } else if(cubit.weather == null){
                    return  Center(
                      child:  Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.9),
                        child: Text('Can\'t find city! please select city'),
                      ),
                    );
                  }else {
                    final weather = cubit.weather!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(weather.main!.temp!.toString(), style: Theme.of(context).textTheme.headline5),
                        Text(weather.weather!.first.main!, style: Theme.of(context).textTheme.headline5),
                        Text(weather.name!, style: Theme.of(context).textTheme.headline5),
                        Text(weather.sys!.country!, style: Theme.of(context).textTheme.headline5),
                        Text(DateTime.fromMillisecondsSinceEpoch(weather.sys!.sunrise!).toString(), style: Theme.of(context).textTheme.headline5),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}