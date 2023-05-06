import 'package:disease_symptoms/consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground),
            fit: BoxFit.fill
        )
    ),

    child: child,
  );
}