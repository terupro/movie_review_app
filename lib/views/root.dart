import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/views/home_page.dart';
import 'package:movie_review_app/views/my_page.dart';

final pageProvider = StateProvider((ref) => 0);

class Root extends ConsumerWidget {
  const Root({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNotifier = ref.watch(pageProvider.notifier);
    List<String> keys = ['ホーム', 'マイページ'];
    List<Icon> icons = const [
      Icon(Icons.home),
      Icon(Icons.person),
    ];
    List<Widget> pages = [const HomePage(), const MyPage()];
    List<BottomNavigationBarItem> navItems = [];
    for (int i = 0; i < keys.length; i++) {
      navItems.add(BottomNavigationBarItem(icon: icons[i], label: keys[i]));
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: headingText(label: '映画レビュー', fontSize: 30)),
        body: pages[pageNotifier.state],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0.15,
                spreadRadius: 0.15,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              items: navItems,
              currentIndex: ref.watch(pageProvider),
              onTap: (index) {
                pageNotifier.state = index;
              },
            ),
          ),
        ),
      ),
    );
  }
}
