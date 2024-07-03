import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.containerColor,
                    borderRadius: BorderRadius.circular(14)),
                width: screenFullWidth / 1.1,
                height: screenFullHeight / 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 1, left: 0, right: 20, bottom: 20),
                          child: const Text(
                            "COMFORT LEVEL",
                            style: TextStyle(
                                color: Color.fromARGB(255, 164, 164, 164),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: LinearProgressIndicator(
                          value: weatherDataCurrent.current.humidity! / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "Feels Like ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.8,
                                      color: CustomColors.textColorBlack,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      "${weatherDataCurrent.current.feelsLike}°C",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      height: 0.8,
                                      color: CustomColors.textColorBlack,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ),
                          Container(
                            height: 25,
                            margin: const EdgeInsets.only(left: 40, right: 40),
                            width: 1,
                            color: CustomColors.dividerLine,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "UV Index ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.8,
                                      color: CustomColors.textColorBlack,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "${weatherDataCurrent.current.uvIndex}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      height: 0.8,
                                      color: CustomColors.textColorBlack,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
