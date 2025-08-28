// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';



// ignore: 
class onboardingpage extends StatelessWidget {
  const onboardingpage({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;
  final Size size;
   

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image(
            alignment: AlignmentGeometry.center,
            image: AssetImage(
              image, //"assets/images/onb1.png"
            ),
            width: size.width * 0.80,
            height: size.height * 0.6,
          ),

          Container(
            width: size.width * 0.90,
            alignment: AlignmentGeometry.center,
            child: Column(
              children: [
                
                Text(
                  title,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.textstyleonboardingbusiness,
                ),
                SizedBox(height: size.height * 0.03),
                //SizedBox(height: 24),
                Container(
                  width: size.width * 0.90,
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    subtitle,
                    //  AppConstant.getRevardforbeign,
                    style: AppConstant.textstyleonboarding1,

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  } 




class onboardingpage1 extends StatelessWidget {
  const onboardingpage1({
    super.key,
    required this.size,
    
   
    required this.image, required this.title1, required this.title2, required this.titlt3, required this.title4, required this.title,
  });

  final String title, title1, title2, titlt3, title4,  image;
  final Size size;
   

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image(
            alignment: AlignmentGeometry.center,
            image: AssetImage(
              image, //"assets/images/onb1.png"
            ),
            width: size.width * 0.80,
            height: size.height * 0.6,
          ),

          Container(
            width: size.width * 0.90,
            alignment: AlignmentGeometry.center,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    // AppConstant.connectWithBusiness,
                    style: AppConstant.textstyleonboardingbusiness,
                  ),
                ),
                
                SizedBox(height: size.height * 0.02),
                Text(
                  title1,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  title2,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),

                SizedBox(height: size.height * 0.02),
                Text(
                  titlt3,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),
                
                SizedBox(height: size.height * 0.02),
                Text(
                  title4,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),
                
                
               
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  } 



class onboardingpage2 extends StatelessWidget {
  const onboardingpage2({
    super.key,
    required this.size,
    
   
    required this.image, required this.title1, required this.title2, required this.titlt3, required this.title4, required this.title,
  });

  final String title, title1, title2, titlt3, title4,  image;
  final Size size;
   

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image(
            alignment: AlignmentGeometry.center,
            image: AssetImage(
              image, //"assets/images/onb1.png"
            ),
            width: size.width * 0.80,
            height: size.height * 0.6,
          ),

          Container(
            width: size.width * 0.90,
            alignment: Alignment.topLeft,
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                  Text(
                    title,
                    // AppConstant.connectWithBusiness,
                    style: AppConstant.textstyleonboardingbusiness,
                  ),
              
                
                SizedBox(height: size.height * 0.02),
                
                   Text(
                    title1,
                    // AppConstant.connectWithBusiness,
                    style: AppConstant.earnrewardstextstyle,
                  ),
              
                SizedBox(height: size.height * 0.02),
                Text(
                  title2,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),

                SizedBox(height: size.height * 0.02),
                Text(
                  titlt3,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),
                
                SizedBox(height: size.height * 0.02),
                Text(
                  title4,
                  // AppConstant.connectWithBusiness,
                  style: AppConstant.earnrewardstextstyle,
                ),
                
                
               
              ],
            ),
          ),
        ],
     
    );
  }
  
  } 