import 'package:flutter/material.dart';

class CustomPredictionWidget extends StatelessWidget {
  const CustomPredictionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Left Circle Logo
        const CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage('assets/images/club4.png'),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(width: 16),

        /// First Dropdown
        Expanded(
          child: GradientDropdown(
            hint: '',
            items: const ['Option 1', 'Option 2', 'Option 3'],
          ),
        ),
        const SizedBox(width: 16),

        /// Second Dropdown
        Expanded(
          child: GradientDropdown(
            hint: '',
            items: const ['Option A', 'Option B', 'Option C'],
          ),
        ),
        const SizedBox(width: 16),

        /// Right Circle Logo
        const CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage('assets/images/club3.png'),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

class GradientDropdown extends StatefulWidget {
  final String hint;
  final List<String> items;

  const GradientDropdown({
    super.key,
    required this.hint,
    required this.items,
  });

  @override
  State<GradientDropdown> createState() => _GradientDropdownState();
}

class _GradientDropdownState extends State<GradientDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
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
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selected,
            hint: Text(widget.hint),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            items: widget.items
                .map(
                  (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                selected = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
