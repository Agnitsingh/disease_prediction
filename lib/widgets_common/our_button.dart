import 'package:disease_symptoms/consts/consts.dart';

Widget ourButton({onPress, color, textColor, String?title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      // primary : redColor,
      primary: color,
      padding: const EdgeInsets.all(12),
    ),

    /* onPressed: (){
        onPress;
      },*/

    onPressed: onPress,
    //child: login.text.white.fontFamily(bold).make());
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
