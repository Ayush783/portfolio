import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/contact/provider/contact_provider.dart';
import 'package:portfolio/contact/widgets/widgets/send_button.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({Key? key, this.isBottom, this.w, this.h})
      : super(key: key);

  final bool? isBottom;
  final double? w;
  final double? h;

  @override
  ConsumerState<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends ConsumerState<ContactForm> {
  @override
  Widget build(BuildContext context) {
    final animate = ref.watch(contactProvider).animate;
    return widget.isBottom!
        ? AnimatedPositioned(
            left: 0,
            right: 0,
            top: animate ? 0 : widget.h!,
            height: widget.h!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: FormBody(widget.w, widget.h),
          )
        : AnimatedPositioned(
            left: animate ? 0 : widget.w!,
            top: 0,
            bottom: 0,
            width: widget.w!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: FormBody(widget.w, widget.h),
          );
  }
}

class FormBody extends StatefulWidget {
  const FormBody(this.w, this.h, {Key? key}) : super(key: key);
  final double? w;
  final double? h;

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final TextEditingController sub = TextEditingController();
  final TextEditingController body = TextEditingController();

  bool formEmpty = false;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: w <= 720 ? 0 : widget.h! / 8,
        horizontal: w <= 720 ? widget.w! / 8 : 0,
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
              child: Semantics(
                textField: true,
                label: 'Subject text field',
                child: TextFormField(
                  decoration: getDecoration('Subject'),
                  controller: sub,
                  validator: (val) => val!.isEmpty ? '' : null,
                  style: AppTypography.bodyTextstyle,
                  cursorColor: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: const Color(0xfff1f1f1),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Semantics(
                label: 'Body textfield',
                textField: true,
                child: TextFormField(
                  decoration: getDecoration('Body'),
                  style: AppTypography.bodyTextstyle,
                  controller: body,
                  cursorColor: AppColors.primaryColor,
                  maxLines: 6,
                  validator: (val) => val!.isEmpty ? '' : null,
                ),
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
