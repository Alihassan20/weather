import 'package:flutter/material.dart';
import 'package:weather/feature/splash/unit/location_denied_dialog.dart';
import '../../core/Routes/routes.dart';
import '../../core/location_services/location_services.dart';
import '../Home/view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with WidgetsBindingObserver {

  AppLifecycleState previousState = AppLifecycleState.inactive;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    getLocation();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed && previousState == AppLifecycleState.paused){
      MagicRouter.navigateAndPopAll(SplashView());
    }
    previousState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void getLocation() async {
    await LocationServices.getCurrentLocation();
    if(LocationServices.currentPosition == null){
      showLocationDeniedDialog();
    }else{
      MagicRouter.navigateAndPopAll(HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}