import 'package:flutter/material.dart';
import 'package:flutteranimation/widgets/cardHover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<WidgetExample> example = [
    WidgetExample(
      title: 'Animated Container',
      builder: (context) => CardHoverWidget(),
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 9,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: example[index].builder,
                ),
              );
            },
            child: Card(
              child: Center(child: Text(example[index].title)),
            ),
          );
        },
        itemCount: example.length,
      ),
    );
  }
}

class WidgetExample {
  final String title;

  final Widget Function(BuildContext) builder;
  final Color? appBarColor;
  final bool isFullScreen;

  WidgetExample({
    required this.title,
    required this.builder,
    this.appBarColor,
    this.isFullScreen = false,
  });
}
