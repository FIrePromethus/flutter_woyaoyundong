import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;
  //增加
  void increment() {
    _count++;
    //通知所有听众刷新
    notifyListeners();
  }

  //减少
  void subtract() {
    _count--;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

//第一个页面
class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
        actions: [
          FlatButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
            child: Text('下一页'),
          ),
        ],
      ),
      body: Center(
        child: Text('${context.watch<Counter>().count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: Text('${Provider.of<Counter>(context).count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().subtract();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
