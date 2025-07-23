import 'package:flutter/material.dart';

import 'CustomPredictionWidget.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Your Prediction",
              style: TextStyle(
                fontSize: 18,
                color: const Color(0xFF0B3666),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),

            const CustomPredictionWidget(),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // important to remove default padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // your action here
              },
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF905E26),
                      Color(0xFFF5EC9B),
                      Color(0xFFF5EC9B),
                      Color(0xFF905E26),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    minHeight: 50,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Submit Your Scores',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )




          ],
        ),
      ),
    );
  }
}

