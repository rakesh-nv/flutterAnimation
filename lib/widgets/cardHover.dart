import 'package:flutter/material.dart';

class CardHoverWidget extends StatefulWidget {
  const CardHoverWidget({super.key});

  @override
  State<CardHoverWidget> createState() => _CardHoverWidgetState();
}

class _CardHoverWidgetState extends State<CardHoverWidget> {
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isTaped = !isTaped;
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(20)),
                duration: const Duration(milliseconds: 350),
                height: isTaped ? 350 : 320,
                // height:500,
                width: 250,
              ),
              AnimatedPositioned(
                top: isTaped ? -100 : 10,
                duration: const Duration(milliseconds: 350),
                child: AnimatedContainer(
                  //color: Colors.red,
                  duration: const Duration(milliseconds: 350),
                  height: isTaped ? 300 : 250,
                  width: 250,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        duration: Duration(milliseconds: 350),
                        height: isTaped ? 300 : 250,
                        width: isTaped ? 230 : 200,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
