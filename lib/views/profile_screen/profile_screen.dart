import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:disease_symptoms/controller/auth_controller.dart';
import 'package:disease_symptoms/controller/profile_controller.dart';
import 'package:disease_symptoms/services/firestore_services.dart';
import 'package:disease_symptoms/views/auth_screen/login_screen.dart';
import 'package:disease_symptoms/views/profile_screen/edit_profile_screen.dart';
import 'package:disease_symptoms/widgets_common/bg_widget.dart';
import 'package:disease_symptoms/widgets_common/our_button.dart';
import 'dart:io';
import 'package:flutter/services.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();

}
class _ProfileState extends State<Profile> {


  int _selectedBox = -1;

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirestorServices.getUser(currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
              if (!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              }
              else{

                var data = snapshot.data!.docs[0];


                return SafeArea(
                  child: Column(
                    children: [

                      // Edit Profile Button

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              color: whiteColor,
                            )).onTap(() {
                          controller.nameController.text = data['name'];
                          //controller.passController.text = data['password'];
                          Get.to(()=> EditProfileScreen(data: data)); // Passing on data..
                        }),
                      ),



                      // Users Details Section

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [

                            data['imageUrl'] == ''?
                            Image.asset(imgProfile,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                                :
                            Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),



                            10.widthBox,

                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}".text.fontFamily(semibold).white.make(),
                                    5.heightBox,
                                    "${data['email']}".text.white.make()
                                  ],
                                )),

                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: whiteColor,
                                    )
                                ),
                                onPressed: ()async{
                                  await Get.put(AuthController()).signoutMethod(context);
                                  Get.offAll(()=> const LoginScreen());
                                },
                                child: logout.text.fontFamily(semibold).white.make()),
                          ],
                        ),
                      ),


                      Container(
                        width: context.screenWidth - 60,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(top: 50, left: 12, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "How was your experience using the app?",
                              style: TextStyle(
                                fontSize: 21,
                                fontFamily: bold,
                                color: greenThree,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: List.generate(6 , (index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Update selected box
                                    _selectedBox = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _selectedBox == index ? lightYellow : Colors.white,
                                        border: Border.all(color: greenThree),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ['Excellent','Superb', 'Good', 'Average','Poor', 'Terrible'][index],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: semibold,
                                            color: greenThree,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),

                            const SizedBox(height: 16),
                            ourButton(color: greenThree, title: "Submit & Exit", textColor: whiteColor, onPress: (){
                              SystemNavigator.pop();
                            }).box.width(context.screenWidth-50)
                                .make(),

                          ],
                        ),
                      ),


                    ],
                  ),
                );
              }
            }
        ),

      ),
    );
  }
}
