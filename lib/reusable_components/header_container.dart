import 'package:flutter/material.dart';
import 'package:interactions_app/extensions/text_ext.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer(
      {super.key, required this.title, required this.subtitle, this.bottom});

  final String title;
  final String subtitle;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(32),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title).styled(size: 32, color: Colors.white),
                        const Spacer(),
                        Text(subtitle).styled(
                            size: 16,
                            weight: FontWeight.w400,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (bottom != null) bottom!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
