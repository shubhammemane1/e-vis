// ignore_for_file: file_names

part of widgets;

class AnimatedTextField extends StatefulWidget {
  const AnimatedTextField({super.key});

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // label: Container(),
        filled: true,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        fillColor: AppColors.primaryColor.withOpacity(0.1),
      ),
    );
  }
}
