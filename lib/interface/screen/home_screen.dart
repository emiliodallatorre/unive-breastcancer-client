import 'package:flutter/material.dart';
import 'package:unive_breastcancer_client/models/predict_request_model.dart';
import 'package:unive_breastcancer_client/models/predict_response_model.dart';
import 'package:unive_breastcancer_client/references.dart';
import 'package:unive_breastcancer_client/resources/provider/prediction_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*
  Radius max: 28.11 min: 6.981
  Perimeter max: 188.5 min: 43.79
  Area max: 2501.0 min: 143.5
   */
  double maxRadius = 28.11, minRadius = 6.981;
  double maxPerimeter = 188.5, minPerimeter = 43.79;
  double maxArea = 2501.0, minArea = 143.5;

  double radius = 28.11, perimeter = 188.5, area = 2501.0;

  PredictResponseModel? predictResponseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(References.appName)),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Radius: ${radius.toStringAsFixed(2)}"),
              Slider(
                value: radius,
                min: minRadius,
                max: maxRadius,
                onChanged: (double value) {
                  setState(() {
                    radius = value;
                  });
                },
                label: "Radius: ${radius.toStringAsFixed(2)}",
              ),
              SizedBox(height: 16.0),
              Text("Perimeter: ${perimeter.toStringAsFixed(2)}"),
              Slider(
                value: perimeter,
                min: minPerimeter,
                max: maxPerimeter,
                onChanged: (double value) {
                  setState(() {
                    perimeter = value;
                  });
                },
                label: "Perimeter: ${perimeter.toStringAsFixed(2)}",
              ),
              SizedBox(height: 16.0),
              Text("Area: ${area.toStringAsFixed(2)}"),
              Slider(
                value: area,
                min: minArea,
                max: maxArea,
                onChanged: (double value) {
                  setState(() {
                    area = value;
                  });
                },
                label: "Area: ${area.toStringAsFixed(2)}",
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() => predictResponseModel = null);
            debugPrint("Predicting...");

            final PredictResponseModel prediction = await PredictionProvider.predict(PredictRequestModel(
              radius: radius,
              perimeter: perimeter,
              area: area,
            ));
            debugPrint("Prediction: ${prediction.diagnosis}");
            setState(() => predictResponseModel = prediction);
          },
          child: const Text("Predict"),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: predictResponseModel == null
                ? const Center(child: Text("No prediction"))
                : Center(
                    child: Column(
                      children: [
                        Text("Prediction: ${predictResponseModel!.diagnosis}"),
                        Text("Probability: ${predictResponseModel!.probabilities}"),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
