import 'package:flutter/material.dart';
//[](https://api.flutter.dev/flutter/widgets/Dismissible-class.html)
/*
作用：滑动删除

继承：Object Diagnosticable DiagnosticableTree Widget StatefulWidget Dismissible

构造函数：（类型 属性 = 默认值）
  const Dismissible({
    @required Key key,
    @required this.child,
    this.background,
    this.secondaryBackground,
    this.confirmDismiss,
    this.onResize,
    this.onDismissed,
    this.direction = DismissDirection.horizontal,
    this.resizeDuration = const Duration(milliseconds: 300),
    this.dismissThresholds = const <DismissDirection, double>{},
    this.movementDuration = const Duration(milliseconds: 200),
    this.crossAxisEndOffset = 0.0,
    this.dragStartBehavior = DragStartBehavior.start,
  }) 
*/

class DismissiblePage extends StatefulWidget {
  DismissiblePage({Key key}) : super(key: key);

  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}  -- 左右滑动删除");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}