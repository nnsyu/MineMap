import 'package:flutter/material.dart';
import 'package:mine_map/util/global_method.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final xCount = 16;
  late int yCount;
  late int totalCount;

  @override
  void initState() {
    super.initState();
    //totalCount = rowCount * rowCount;
    yCount = GlobalMethod().calculateY(xCount, 4/3);
    totalCount = xCount * yCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(10),
        minScale: 0.05,
        maxScale: xCount/2,
        child: Center(
          child: Container(
            width: xCount.toDouble(),
            height: yCount.toDouble(),
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: xCount,
                    children: List.generate(
                      totalCount,
                      (index) {
                        return GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.5), width: 0.5),
                              color: index == 5 ? Colors.blue[200] : Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Item $index was tapped'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
