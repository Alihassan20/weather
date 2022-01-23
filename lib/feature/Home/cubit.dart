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
      final lat = LocationServices.currentPosition!.latitude;
      final lon = LocationServices.currentPosition!.longitude;
      final response = await DioHelper.get('lat=$lat&lon=$lon');
      weather = Weather.fromJson(response.data);
    }catch(e){
      print(e);
    }
    emit(HomeInit());
  }
}