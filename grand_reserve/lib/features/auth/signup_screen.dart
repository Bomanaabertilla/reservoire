import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Join Our Club',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Experience luxury and comfort with us',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              const CustomTextField(label: 'Full Name', hint: 'John Doe'),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Email',
                hint: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Confirm Password',
                hint: '••••••••',
                obscureText: true,
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _agreedToTerms,
                      activeColor: AppColors.primaryBlue,
                      side: BorderSide(color: AppColors.textPlaceholder),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'I agree to the Terms and Conditions',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Create Account',
                onPressed: () {
                  // TODO: Perform signup
                },
              ),

              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.surface)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR SIGN UP WITH',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textPlaceholder,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.surface)),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialIconBtn(icon: Icons.g_mobiledata),
                  const SizedBox(width: 24),
                  _SocialIconBtn(icon: Icons.facebook),
                  const SizedBox(width: 24),
                  _SocialIconBtn(icon: Icons.apple),
                ],
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconBtn extends StatelessWidget {
  final IconData icon;

  const _SocialIconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surface),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
