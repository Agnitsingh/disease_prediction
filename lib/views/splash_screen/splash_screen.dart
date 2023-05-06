import 'package:firebase_auth/firebase_auth.dart';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/widgets_common/applogo_widget.dart';
import 'package:disease_symptoms/consts/images.dart';
import 'package:disease_symptoms/views/auth_screen/login_screen.dart';
import 'package:disease_symptoms/views/home_body/body_part.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // Creating a method to change screen...
  changeScreen(){
    Future.delayed(const Duration(seconds: 3), (){
      //Get.to(()=>const LoginScreen());

      //If already logged in, we don't want to go to login screen


      auth.authStateChanges().listen((User ? user) {
        if (user == null && mounted){
          Get.to(()=>const LoginScreen());
        }else{
          Get.to(()=>SelectBodyPartPage());
        }
      });




    });
   }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenThree,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
            30.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            // Our SplashScreen UI is ready!!!
          ],
        ),
      ),
    );
  }
}
