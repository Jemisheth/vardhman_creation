import 'package:flutter/material.dart';
import 'package:vardhman_creation/global/bottom_sheet.dart';
import 'package:vardhman_creation/global/button.dart';
import 'package:vardhman_creation/global/column_box_widget.dart';
import 'package:vardhman_creation/utils/colors.dart';
import 'package:vardhman_creation/utils/constant.dart';
import 'package:vardhman_creation/utils/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F1F1),
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: blackColor),
            onPressed: () {
              showSocialMediaSheet(context); // Show social media icons on tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: isLandscape ? screenWidth * 0.1 : screenWidth * 0.15,
                child: Image.asset('assets/images/profile_pic.png'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'San Karla',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackShade2,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'Delhi, India',
                style: TextStyle(fontSize: 14, color: greyColor),
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStatColumn('250K', 'Followers', screenWidth),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.05),
                  buildStatColumn('1,200', 'Following', screenWidth),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.05),
                  buildStatColumn('320', 'Posts', screenWidth),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Fashion & Lifestyle Influencer 💃 | Sharing daily outfit inspo, trends, and travel diaries. Let’s collab! ✨',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: blackShade1, height: 1.5),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Follow Button with Contact Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonButton(
                    onTap: () {},
                    title: "Follow",
                    colorBackground: buttonBg,
                    width: isLandscape ? screenWidth * 0.3 : screenWidth * 0.7,
                    height:
                        isLandscape
                            ? screenHeight * 0.13
                            : screenHeight * 0.055,
                    textStyle: TextStyle(
                      fontSize:
                          isLandscape
                              ? 26 * getResponsiveText(context)
                              : 20 * getResponsiveText(context),
                      color: white,
                    ),
                  ),
                  Container(
                    width: screenWidth * .12,
                    height:
                        isLandscape ? screenHeight * 0.13 : screenHeight * .055,
                    decoration: BoxDecoration(
                      color: buttonBg,
                      border: Border.all(color: buttonBg),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.email, // Using email icon as a contact icon
                        color: blackShade1,
                        size: 30,
                      ),
                      onPressed: () {
                        // Add logic for contact action (e.g., open email or chat)
                        print('Contact San Karla');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              // Posts Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 5 : 3,
                  crossAxisSpacing: screenWidth * 0.02,
                  mainAxisSpacing: screenHeight * 0.01,
                  childAspectRatio: 1,
                ),
                itemCount: fashionPhotoUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(fashionPhotoUrls[index]),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          print('Failed to load image: $exception');
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
