import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/views/my_in_app_web_view.dart';
import '../widgets/feedback_banner.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isSwitched = false;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Settings',
          style: SettingsTextStyle.back,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Container(
                  width: size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: FeedbackBanner(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Container(
                  width: size.width * 0.95,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SettingsTile(
                          text: 'Terms of use',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyScreenForVIew(
                                    url:
                                        'https://docs.google.com/document/d/1cVEnK-ibenqYesLiYc_NaZAnNANww30R2YBrVGHpSYU/edit?usp=sharing'),
                              ),
                            );
                          },
                          action: SvgPicture.asset('assets/icons/arrow.svg'),
                          assetName: 'assets/icons/terms.svg',
                        ),
                        const Divider(
                          indent: 4,
                          endIndent: 8,
                          height: 1.0,
                          thickness: 0.2,
                          color: Colors.grey,
                        ),
                        SettingsTile(
                          text: 'Privacy Policy',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyScreenForVIew(
                                    url:
                                        'https://docs.google.com/document/d/1nNEI9SNuGGk4FZc3ov73-4-D_F8CcOgwWU9bVn4ezsI/edit?usp=sharing'),
                              ),
                            );
                          },
                          action: SvgPicture.asset('assets/icons/arrow.svg'),
                          assetName: 'assets/icons/privacy.svg',
                        ),
                        const Divider(
                          indent: 4,
                          endIndent: 8,
                          height: 1.0,
                          thickness: 0.2,
                          color: Colors.grey,
                        ),
                        SettingsTile(
                          text: 'Support page',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyScreenForVIew(
                                    url: 'https://forms.gle/zagxQi7aWTfierg46'),
                              ),
                            );
                          },
                          action: SvgPicture.asset('assets/icons/arrow.svg'),
                          assetName: 'assets/icons/support.svg',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
