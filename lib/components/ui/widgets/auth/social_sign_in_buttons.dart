// social_sign_in_buttons.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSocialButton(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          color: Colors.red,
          onPressed: () {},
        ),
        SizedBox(height: 8),
        _buildSocialButton(
          icon: FontAwesomeIcons.twitter,
          label: 'Twitter',
          color: Colors.lightBlue,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon, color: Colors.white),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
