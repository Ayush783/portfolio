import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/contact/provider/contact_provider.dart';

import '../widgets/contact_details.dart';
import '../widgets/contact_form.dart';

class ContactView extends ConsumerStatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends ConsumerState<ContactView> {
  ScrollNotificationObserver? scrollObserver;

  @override
  void initState() {
    super.initState();
    context
        .findAncestorStateOfType<NestedScrollViewState>()!
        .innerController
        .addListener(() {
      _onScroll(context);
    });
  }

  void _onScroll(BuildContext context) {
    final pos = context
        .findAncestorStateOfType<NestedScrollViewState>()!
        .innerController
        .offset;
    final h = MediaQuery.of(context).size.height;
    if ((pos > 3 * h + 180) && !ref.read(contactProvider).onScreen) {
      setState(() {
        ref.read(contactProvider).animatePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final onScreen = ref.watch(contactProvider).onScreen;
    return AnimatedOpacity(
      opacity: onScreen ? 1 : 0,
      duration: const Duration(milliseconds: 370),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            const Expanded(
              child: ContactDetails(),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    ContactForm(
                        isBottom: constraints.maxWidth < 480,
                        w: constraints.maxWidth),
                  ],
                );
              }),
            )
          ],
        );
      }),
    );
  }
}
