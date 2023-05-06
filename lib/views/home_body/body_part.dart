import 'package:disease_symptoms/consts/colors.dart';
import 'package:disease_symptoms/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:disease_symptoms/views/body_symptoms/skin_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/eyes_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/face_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/hands_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/head_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/heart_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/kidney_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/legs_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/liver_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/mouth_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/muscle_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/neck_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/nose_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/stomach_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/bladder_symptoms.dart';
import 'package:disease_symptoms/views/body_symptoms/other_symptoms.dart';


class SelectBodyPartPage extends StatefulWidget {
  @override
  _SelectBodyPartPageState createState() => _SelectBodyPartPageState();
}

class _SelectBodyPartPageState extends State<SelectBodyPartPage> {
  List<String> bodyParts = [ 'Eyes', 'Skin' ,   'Face',    'Hands',    'Head',    'Heart',    'Kidney',    'Legs',    'Liver',    'Mouth',    'Muscle',    'Neck',    'Nose',   'Stomach',    'Bladder',    'Others',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Body Part',
          style: TextStyle(
            fontFamily: bold,
          ),
        ),
        backgroundColor: greenThree,
      ),
      body: Container(
        color: greenThree,
        child: GridView.builder(
          itemCount: bodyParts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (bodyParts[index] == 'Skin') {
                  // Navigate to the skin symptom page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkinSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Eyes') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EyesSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Face') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaceSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Hands') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HandSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Head') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeadSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Heart') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeartSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Kidney') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KidneySymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Legs') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LegSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Liver') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiverSymptomPage(),
                    ),
                  );
                }


                else if (bodyParts[index] == 'Mouth') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MouthSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Muscle') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MuscleSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Neck') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NeckSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Nose') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoseSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Stomach') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StomachSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Bladder') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BladderSymptomPage(),
                    ),
                  );
                }

                else if (bodyParts[index] == 'Others') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtherSymptomPage(),
                    ),
                  );
                }




              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    bodyParts[index],
                    style: const TextStyle(
                      color: greenThree,
                      fontFamily: bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}

