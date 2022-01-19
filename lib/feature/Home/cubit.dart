import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/Home/states.dart';

import '../../core/Dio_helpers/dio_helper.dart';
import '../../core/location_services/location_services.dart';
import '../../core/model/weather.dart';

class HomeCubit extends  Cubit<HomeStats>{
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context)=>BlocProvider.of(context);


  Weather? weather;

  Future<void> getCurrentWeather() async {

    emit(HomeLoading());
    try{
      final position = await LocationServices.getCurrentLocation();
      final response = await DioHelper.get('lat=${position.latitude}&lon=${position.longitude}');
      // 'lat=${position.latitude}&lon=${position.longitude}'
      weather = Weather.fromJson(response.data);
    }catch(e){
      print(e);
    }
    emit(HomeInit());
  }
}