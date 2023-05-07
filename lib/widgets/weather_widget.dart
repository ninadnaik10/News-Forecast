import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:weather_news_app/models/weather_model.dart';
import 'package:weather_news_app/constants/newsapiurl.dart';

class WeatherWidget extends StatefulWidget {
  final Current current;
  final Location location;
  const WeatherWidget({Key? key, required this.current, required this.location}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  // String _locality = "Loading...";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black54,),
              Text(widget.location.name ?? "Not Available", style: const TextStyle(fontSize: 20),),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                  imageUrl: 'http:${widget.current.condition?.icon}' ??
                      NewsApiUrl.imageNotFound),
              // BoxedIcon(icon),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.current.tempC?.round()}\u{00B0}" ?? "NA",
                    style: const TextStyle(
                        fontSize: 112, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Feels like ${widget.current.feelslikeC?.round()}\u{00B0}C",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.wind,
                        size: 70,
                        color: Colors.black54,
                      ),
                      Text(
                          "${widget.current.windKph.toString()} kph" ??
                              "No data",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      const Text(
                        "Wind",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.droplet,
                        size: 70,
                        color: Colors.black54,
                      ),
                      Text("${widget.current.humidity}%" ?? "No data",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      const Text(
                        "Humidity",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.eye,
                        size: 70,
                        color: Colors.black54,
                      ),
                      Text("${widget.current.visKm} km" ?? "No data",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      const Text(
                        "Visibility",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // getCity() async {
  //   final locationData = await LocationServices().checkLocation();
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
  //
  //   Placemark place = placemarks[0];
  //   setState(() {
  //     _locality = place.locality! ?? "Not Available";
  //   });
  // }
}
