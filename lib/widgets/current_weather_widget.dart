import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area
        tempeatureAreaWidget(),

        const SizedBox(
          height: 20,
        ),
        // more details - windspeed, humidity, clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return
        //  Container(
        //                   height: 150 ,
        //                   width: double.infinity,
        //                   child: Center(
        //                       child: Text(
        //                     'Feels Like ',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.w500),
        //                   )));

        SizedBox(
      width: screenFullWidth / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 29, 32, 45),
              borderRadius: BorderRadius.circular(20),
            ),
            height: screenFullHeight / 6,
            width: screenFullWidth / 2.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'WIND',
                    style: TextStyle(
                        color: Color.fromARGB(255, 165, 165, 165),
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/icons/windspeed.png',
                    scale: 2,
                  ),
                  Text(
                    "${weatherDataCurrent.current.windSpeed}km/h",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 29, 32, 45),
              borderRadius: BorderRadius.circular(20),
            ),
            height: screenFullHeight / 6,
            width: screenFullWidth / 2.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'HUMIDITY',
                    style: TextStyle(
                        color: Color.fromARGB(255, 165, 165, 165),
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/icons/humidity.png',
                    scale: 2,
                  ),
                  Text(
                    "${weatherDataCurrent.current.humidity}%",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    }

  Widget tempeatureAreaWidget() {
    return
        Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 29, 32, 45),
        borderRadius: BorderRadius.circular(20),
      ),
      height: screenFullHeight / 5,
      width: screenFullWidth / 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Image.asset(
                  "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${weatherDataCurrent.current.temp!.toInt()}°C",
                    style: const TextStyle(
                      fontSize: 50,
                      wordSpacing: 0,
                      letterSpacing: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherDataCurrent.current.weather![0].description!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Feels Like ${weatherDataCurrent.current.feelsLike!.toInt()}°C",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 167, 167, 167),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
