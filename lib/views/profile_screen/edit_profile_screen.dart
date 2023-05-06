import 'dart:io';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/controller/profile_controller.dart';
import 'package:disease_symptoms/widgets_common/bg_widget.dart';
import 'package:disease_symptoms/widgets_common/custom_textfield.dart';
import 'package:disease_symptoms/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {

  final dynamic data;



  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();



    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),


        body: Obx(
              ()=> SingleChildScrollView(
                child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

                // If data image url and controller path is empty

                data['imageUrl'] == '' &&  controller.profileImgPath.isEmpty
                    ?  Image.asset(imgProfile,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()

                // If data is not empty but controller path is empty

                    :  data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                    ? Image.network(data['imageUrl'], width: 100,
                    fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()

                // If both are empty

                    : Image.file(File(controller.profileImgPath.value),
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),

                10.heightBox,
                ourButton(color: greenThree, onPress: (){
                  controller.changeImage(context);
                },
                    textColor: whiteColor, title: "Change"),
                const Divider(),

                20.heightBox,

                customTextField(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass: false),

                10.heightBox,

                customTextField(
                    controller: controller.oldpassController,
                    hint: passwordHint,
                    title: oldpass,
                    isPass: true),

                10.heightBox,

                customTextField(
                    controller: controller.newpassController,
                    hint: passwordHint,
                    title: newpass,
                    isPass: true),

                20.heightBox,

                controller.isloading.value
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(greenThree),
                )
                    : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(color: greenThree, onPress: ()async{


                      controller.isloading(true);

                      // If image is not selected...

                      if (controller.profileImgPath.value.isNotEmpty){
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink = data['imageUrl'];
                      }

                      // If Old Password matches database

                      if(data['password'] == controller.oldpassController.text){

                        // Authentication
                        await controller.changeAuthPassword(
                          email: data['email'],
                          password: controller.oldpassController.text,
                          newpassword: controller.newpassController.text,
                        );
                        // We passed await taaki pehle ye statement execute ho fir banki sab..


                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.newpassController.text,
                        );
                        VxToast.show(context, msg: "Updated");
                      }else{
                        VxToast.show(context, msg: "Wrong old password");
                        controller.isloading(false);
                      }
                    },
                        textColor: whiteColor, title: "Save")
                ),

            ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
              ),
        ),
      ),
    );
  }
}
