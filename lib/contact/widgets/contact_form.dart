import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/contact/provider/contact_provider.dart';
import 'package:portfolio/contact/widgets/widgets/send_button.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({Key? key, this.isBottom, this.w}) : super(key: key);

  final bool? isBottom;
  final double? w;

  @override
  ConsumerState<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends ConsumerState<ContactForm> {
  final TextEditingController sub = TextEditingController();
  final TextEditingController body = TextEditingController();

  bool formEmpty = false;

  bool animate = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<ContactNotifier>(contactProvider, (p, n) {
      if (n.onScreen && animate == false) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            animate = true;
          });
        });
      }
    });
    return AnimatedPositioned(
      left: animate ? 0 : widget.w!,
      top: 0,
      bottom: 0,
      width: widget.w!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.w! / 8,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xfff1f1f1),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextFormField(
                  decoration: getDecoration('Subject'),
                  controller: sub,
                  validator: (val) => val!.isEmpty ? '' : null,
                  style: AppTypography.bodyTextstyle,
                  cursorColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: const Color(0xfff1f1f1),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextFormField(
                  decoration: getDecoration('Body'),
                  style: AppTypography.bodyTextstyle,
                  controller: body,
                  cursorColor: AppColors.primaryColor,
                  maxLines: 6,
                  validator: (val) => val!.isEmpty ? '' : null,
                ),
              ),
              const SizedBox(height: 4),
              if (formEmpty)
                Text(
                  'Cannot be left empty!',
                  style: AppTypography.boldBodyTextstyle
                      .copyWith(fontSize: 12, color: Colors.red),
                ),
              const SizedBox(height: 12),
              SendButton(
                ontap: () {
                  if (sub.text.isEmpty || body.text.isEmpty) {
                    setState(() {
                      formEmpty = true;
                    });
                  } else {
                    setState(() {
                      formEmpty = false;
                    });
                    UrlLaunchUtil.launch(
                        'mailto:aayush9778@gmail.com?subject=${sub.text}&body=${body.text}');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTypography.lightBodyTextstyle,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }
}
