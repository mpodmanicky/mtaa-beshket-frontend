import 'package:flutter/material.dart';
import 'package:flutter/animation.dart'; // Import for animations

class MyButton extends StatefulWidget {
  const MyButton({super.key, this.onTap, required this.hintText});

  final void Function()? onTap;
  final String hintText;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200), // Adjust animation duration
  );

  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 1.0, end: 0.9)
          .animate(_controller); // Button press scale animation

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller
            .forward()
            .then((_) => _controller.reverse()); // Animate press and release
        widget.onTap?.call(); // Call onTap after animation
        FocusScope.of(context)
            .unfocus(); // Deselect text fields on button press (using FocusScope)
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors
                .blue, // Use a specific color (avoid GlobalAppBar.appBarColor)
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              widget.hintText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
