import 'package:flutter/material.dart';
import 'package:weather/core/Routes/routes.dart';
import 'package:weather/feature/Home/view.dart';

import '../../core/location_services/location_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }
  void getLocation()async{
    final position = await LocationServices.getCurrentLocation();
    print(position.longitude);
    print(position.latitude);
    MagicRouter.navigateAndPopAll(  HomeView());

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
         child: Icon(Icons.person,size: 50,),
      ),
    );
  }
}
