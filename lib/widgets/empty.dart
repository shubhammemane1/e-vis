part of widgets;

class Empty extends StatelessWidget {
  const Empty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 0,
      height: 0,
    );
  }
}