import 'package:calori_tracker/components/widget/radial_progress_widget.dart';
import 'package:flutter/material.dart';

class RadialProgressPage extends StatelessWidget {
  const RadialProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      color: Colors.black87,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const RadialProgress(
                grosorPrimario: 20,
                grosorSecundario: 21,
                tipoBordes: StrokeCap.round,
                porcentaje: 80,
                colorPrimario: Colors.green,
                colorSecundario: Colors.white,
                height: 150,
                width: 150,
                text: "Calories",
                textColor: Colors.white,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      RadialProgress(
                        grosorPrimario: 8,
                        grosorSecundario: 11,
                        porcentaje: 60,
                        colorPrimario: Colors.red,
                        colorSecundario: Colors.white,
                        text: "Protein",
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      RadialProgress(
                        grosorPrimario: 12,
                        grosorSecundario: 8,
                        tipoBordes: StrokeCap.round,
                        porcentaje: 60,
                        colorPrimario: Colors.red,
                        colorSecundario: Colors.white,
                        text: "Carbs",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const RadialProgress(
                      grosorPrimario: 12,
                      grosorSecundario: 12,
                      tipoBordes: StrokeCap.round,
                      porcentaje: 60,
                      colorPrimario: Colors.red,
                      colorSecundario: Colors.white,
                      text: "Fat",
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
