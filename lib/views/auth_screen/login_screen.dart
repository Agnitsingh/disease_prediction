import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/controller/auth_controller.dart';
import 'package:disease_symptoms/views/auth_screen/signup_screen.dart';
import 'package:disease_symptoms/views/profile_screen/profile_screen.dart';
import 'package:disease_symptoms/widgets_common/applogo_widget.dart';
import 'package:disease_symptoms/widgets_common/bg_widget.dart';
import 'package:disease_symptoms/widgets_common/custom_textfield.dart';
import 'package:disease_symptoms/widgets_common/our_button.dart';
import 'package:disease_symptoms/views/home_body/body_part.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                // Responsive Space as per device...
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,

                Obx(
                      ()=> Column(
                    children: [
                      customTextField(title: email, hint: emailHint, isPass: false, controller: controller.emailController),
                      customTextField(title: password, hint: passwordHint, isPass: true, controller: controller.passwordController),

                      Align(alignment: Alignment.centerRight, child: TextButton(onPressed: ()async{
                        await controller.loginMethod(context: context).then((value){
                          if (value != null){
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(()=> SelectBodyPartPage());
                          }
                        });
                      }, child: forgetPass.text.make())),
                      5.heightBox,

                      //ourButton().box.width(context.screenWidth-50).make(),
                      controller.isloading.value ?
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(greenThree), // If true
                      )
                          : ourButton(
                          color: greenThree,
                          title: login,
                          textColor: whiteColor,
                          onPress: ()async{
                            controller.isloading(true);

                            await controller.loginMethod(context: context).then((value){
                              if (value!=null){
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(()=>SelectBodyPartPage());
                              }else{
                                controller.isloading(false);
                              }
                            });
                          })
                          .box.width(context.screenWidth-50)
                          .make(),
                      5.heightBox,

                      createNewAccount.text.color(fontGrey).make(),
                      5.heightBox,

                      ourButton(color: greenThree, title: signup, textColor: whiteColor, onPress: (){
                        Get.to(()=>SignupScreen());
                      })
                          .box.width(context.screenWidth-50)
                          .make(),
                      10.heightBox,

                      /*
                      loginWith.text.color(fontGrey).make(),
                      5.heightBox,
                      */

                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width:30,
                                ),
                              ),
                            )),
                      ),*/
                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
                )
              ],
            ),
          ),
        ));
  }
}
