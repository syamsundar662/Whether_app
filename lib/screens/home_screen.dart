import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_data_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override 
  Widget build(BuildContext context) {
    size(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 12, 25),
      body: Obx(() => globalController.checkLoading().isTrue
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/clouds.png",
                  height: 200,
                  width: 200,
                ),
                const CircularProgressIndicator.adaptive()
              ],
            ))
          : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  ComfortLevel(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather())
                ],
              ),
            )),
    );
  }
}
