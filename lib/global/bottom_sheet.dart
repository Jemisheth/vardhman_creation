import 'package:flutter/material.dart';
import 'package:vardhman_creation/global/social_widget.dart';
import 'package:vardhman_creation/utils/colors.dart';

void showSocialMediaSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: buttonBg.withOpacity(0.8), // Dark background for contrast
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text(
                'Share Profile',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialIcon(
                    'Facebook',
                    'assets/icons/facebook.png',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  socialIcon(
                    'Instagram',
                    'assets/icons/instagram.png',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  socialIcon(
                    'Twitter',
                    'assets/icons/twitter.png',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }