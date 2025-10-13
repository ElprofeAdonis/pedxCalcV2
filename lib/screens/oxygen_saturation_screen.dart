import 'package:flutter/material.dart';

class OxygenSaturationScreen extends StatelessWidget {
  const OxygenSaturationScreen({super.key});

  static const Color infoBoxColor = Color.fromARGB(255, 14, 113, 194);
  static const TextStyle headerTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 16,
  );
  static const TextStyle bodyTextStyle = TextStyle(fontSize: 16, height: 1.5);

  static const TextStyle boldBodyTextStyle = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturación de oxígeno (SpO₂)'),
        backgroundColor: infoBoxColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              decoration: const BoxDecoration(
                color: infoBoxColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: const Text(
                'Saturación de oxígeno (SpO₂)',
                style: headerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 83, 232, 103),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'SpO₂ es menor en el período neonatal inmediato.\n',
                      style: bodyTextStyle,
                    ),
                    TextSpan(
                      text: 'Más allá de este período, una SpO₂ de ',
                      style: bodyTextStyle,
                    ),
                    TextSpan(text: '<90-92%', style: boldBodyTextStyle),
                    TextSpan(text: ' puede sugerir una ', style: bodyTextStyle),
                    TextSpan(
                      text: 'condición respiratoria',
                      style: boldBodyTextStyle,
                    ),
                    TextSpan(text: ' o ', style: bodyTextStyle),
                    TextSpan(
                      text: 'cardiopatía cianótica.',
                      style: boldBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'La saturación de oxígeno se considera un signo vital clave para evaluar la oxigenación.',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 95, 95, 95),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
