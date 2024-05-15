import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/interestes/provider/interest_view_provider.dart';

import '../../theme/theme.dart';

class InterestTextsListView extends ConsumerStatefulWidget {
  const InterestTextsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<InterestTextsListView> createState() =>
      _InterestTextsListViewState();
}

class _InterestTextsListViewState extends ConsumerState<InterestTextsListView> {
  Timer? _timer;
  bool switchText = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        if (ref.read(ivProvider).onscreen) {
          setState(() {
            switchText = true;
          });
          Future.delayed(const Duration(milliseconds: 370), () {
            setState(() {
              ref.read(ivProvider).incrementTIndex();
              switchText = false;
            });
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i = ref.watch(ivProvider).tIndex;
    final w = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedPadding(
        duration: const Duration(milliseconds: 370),
        padding: EdgeInsets.only(
          top: switchText ? 32 : 0,
          left: w > 600
              ? w / 4
              : w > 400
                  ? w / 6
                  : w / 8,
          right: w > 600
              ? w / 4
              : w > 400
                  ? w / 6
                  : w / 8,
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 370),
          opacity: switchText ? 0 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                label: titles[i],
                child: Text(
                  titles[i],
                  style: AppTypography.boldHeadingTextstyle2,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Semantics(
                label: texts[i],
                child: AutoSizeText(
                  texts[i],
                  style: AppTypography.bodyTextstyle2,
                  textAlign: TextAlign.center,
                  maxLines: 18,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    });
  }
}

const List<String> titles = [
  'Mountains & Adventure',
  'Fur Balls',
  'Animes',
  'Wheels',
  'Gaming',
];

const List<String> texts = [
  'The incredible feeling you get while cruising through mountainous roads makes your heart skip a beat. This is the same feeling that I crave from the bottom of my heart.\n\nThe chilly winds and cloudy sky makes you want to explore every inch you can reach.\n\nI\'m also a big fan of adventurous sports like rafting and cliff jumping as well.',
  'There\'s one thing I like more than traveling - Fur balls. I just can\'t resist loving them\n\nI love dogs and cats the most. I have a pet dog too, She\'s named Zeeva. There are a bunch of stray cats in my college which are pretty much friendly.\n\nOne day I\'d like to adopt many dogs and cats!!.',
  'I\'m a huge fan of animes and I\'ve watched like hundreds of them. I used to watch web series and movies but there\'s nothing as awesome as animes.\n\nMy first anime was obviously Naruto (most people start with this only). My fav anime till now is One Piece.\n\nI\'d be happy to recommend to you what to watch any time!.',
  'There\'s no denying the fact that boys love wheels more than anything. I also have a passion for bikes and cars.\n\nThe thrill of speed is something that bulks up your adrenaline and I like it too but I like to keep it to a safer side.',
  'And then there is video gaming, Who does\'nt like video games!? I like all sorts of them mobile or PC.\n\nMy first love in video gaming was the COD series and the thrill of first-person shooters. On mobile, I loved playing PUBG with my midnight gang. There\'s no replacing a break time where you can play video games with friends!!.',
];
