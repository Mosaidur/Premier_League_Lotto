import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime targetTime;

  const CountdownTimerWidget({super.key, required this.targetTime});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Duration timeLeft = Duration();

  late Timer timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      timeLeft = widget.targetTime.difference(now);
      if (timeLeft.isNegative) {
        timeLeft = Duration.zero;
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = timeLeft.inDays.toString().padLeft(2, '0');
    final hours =
    (timeLeft.inHours % 24).toString().padLeft(2, '0');
    final minutes =
    (timeLeft.inMinutes % 60).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            "Time Left",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeBox(days),
              _buildColon(),
              _buildTimeBox(hours),
              _buildColon(),
              _buildTimeBox(minutes),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 35, child: Center(child: Text("Days", style: TextStyle(fontSize: 12)))),
              SizedBox(width: 20),
              SizedBox(width: 35, child: Center(child: Text("Hours", style: TextStyle(fontSize: 12)))),
              SizedBox(width: 20),
              SizedBox(width: 50, child: Center(child: Text("Minutes", style: TextStyle(fontSize: 12)))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimeBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF905E26),
            Color(0xFFF5EC9B),
            Color(0xFFF5EC9B),
            Color(0xFF905E26),
          ],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildColon() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ":",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
