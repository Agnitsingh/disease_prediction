import 'package:disease_symptoms/controller/auth_controller.dart';
import 'package:disease_symptoms/views/profile_screen/profile_screen.dart';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/widgets_common/applogo_widget.dart';
import 'package:disease_symptoms/widgets_common/bg_widget.dart';
import 'package:disease_symptoms/widgets_common/custom_textfield.dart';
import 'package:disease_symptoms/widgets_common/our_button.dart';
import 'package:disease_symptoms/views/home_body/body_part.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());

  // Text Controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                "Join the $appname family".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,


                // The below column has signup button... So we need to rap it



                Obx(
                      ()=> Column(
                    children: [
                      customTextField(title: name, hint: nameHint, controller: nameController, isPass: false),
                      customTextField(title: email, hint: emailHint, controller: emailController, isPass: false),
                      customTextField(title: password, hint: passwordHint, controller: passwordController, isPass: true),
                      customTextField(title: retypePassword, hint: passwordHint, controller: passwordRetypeController, isPass: true),

                      //Align(alignment: Alignment.centerRight, child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                      10.heightBox,

                      //ourButton().box.width(context.screenWidth-50).make(),
                      //ourButton(color: greenThree, title: login, textColor: whiteColor, onPress: (){})
                      //    .box.width(context.screenWidth-50)
                      //    .make(),
                      5.heightBox,

                      Row(
                        children: [Checkbox(
                          checkColor: redColor,
                          //value: false,
                          value: isCheck,
                          onChanged: (newValue){
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),

                          8.widthBox,

                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "I agree that prediction is for ",
                                        style: TextStyle(
                                          fontFamily: semibold,
                                          color: fontGrey,
                                        )),

                                    TextSpan(
                                        text: termsAndCond,
                                        style: TextStyle(
                                          fontFamily: semibold,
                                          color: greenThree,
                                        )),

                                    TextSpan(
                                        text: " & is not a ",
                                        style: TextStyle(
                                          fontFamily: semibold,
                                          color: fontGrey,
                                        )),

                                    TextSpan(
                                        text: privacyPolicy,
                                        style: TextStyle(
                                          fontFamily: semibold,
                                          color: greenThree,
                                        )),
                                  ]
                              ),
                            ),
                          )
                        ],
                      ),

                      5.heightBox,

                      controller.isloading.value? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(greenThree), // If true
                      )
                          : ourButton(color: isCheck==true ? greenThree : lightGrey, title: signup, textColor: whiteColor,
                          onPress: ()async{
                            if (isCheck != false){

                              controller.isloading(true);

                              try{
                                await controller.signupMethod(
                                    context: context, email: emailController.text, password: passwordController.text).then((value){
                                  return controller.storeUserData(email: emailController.text, password: passwordController.text, name: nameController.text,);
                                }).then((value){
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(()=>SelectBodyPartPage());
                                });
                              } catch (e){
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isloading(false);
                              }
                            }
                          })
                          .box.width(context.screenWidth-50)
                          .make(),
                      10.heightBox,

                      // Wrapping into gesture detector of Velocity X
                      /*RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: alreadyHaveAccount,
                                  style: TextStyle(fontFamily: bold, color: fontGrey),
                              ),
                              TextSpan(
                                  text: login,
                                  style: TextStyle(fontFamily: bold, color: redColor),
                              ),
                            ],
                          ),
                      ).onTap(() {
                        Get.back();
                      }),*/

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyHaveAccount.text.semiBold.color(greenThree).make().onTap(() {
                        Get.back();
                        }),
                        ],
                      ),

                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
                )
              ],
            ),
          ),
        ));
  }
}

