import 'package:flutter/material.dart';
import 'dart:math';

/* 

PaginatedDataTable(
  header	表的标题
  actions	图标按钮显示在表的右上角
  List<DataColumn> columns	表中列的配置和标签 
  sortColumnIndex	排序的列
  bool sortAscending = true	是否按升序排序
  onSelectAll	全选/全部选  操作
  int initialFirstRowIndex = 0	首次创建时显示的索引
  onPageChanged	翻页监听
  rowsPerPage	每页行数，默认defaultRowsPerPage
  onRowsPerPageChanged	每页行数改变监听
  List availableRowsPerPage	为用户提供每页行数选择
  DragStartBehavior dragStartBehavior = DragStartBehavior.start
  source	数据源
)

source 使用PaginatedDataTable应配合DataTableSource一起

新建一个Class继承DataTableSource这个抽象类，实现4个方法：
  DataRow getRow(int index) { //根据索引获取内容行 }
  bool get isRowCountApproximate => false;
  int get rowCount => _shops.length;//数据总条数
  int get selectedRowCount => _selectCount;//选中的行数
*/

class Table1Page extends StatefulWidget {
  @override
  _Table1State createState() => _Table1State();
}

class _Table1State extends State<Table1Page> {
  // 默认一页行数
  int _defalutRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  MyTable table = MyTable();
  int _sortColumnIndex = 0;
  bool _sortAscending=true;

  //排序关联_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Mybean s),int index,bool b){
    table._sort(getField, b);
    setState(() {
      this._sortColumnIndex=index;
      this._sortAscending=b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PaginatedDataTable'),),
      body: ListView(
        children: <Widget>[
          PaginatedDataTable(
            header:Text('这里是标题'),
            sortColumnIndex:_sortColumnIndex,
            sortAscending: _sortAscending,
            rowsPerPage: _defalutRowPageCount,
            onRowsPerPageChanged: (value) {
              setState(() {
                _defalutRowPageCount = value;
              });
            },
            initialFirstRowIndex: 0,
            availableRowsPerPage: [5,10,11],
            onPageChanged: (value){
              print('翻页： $value');
            },
            onSelectAll: table.selectAll,
            columns:[
              DataColumn(label:Text('单位'),onSort: (i,b){_sort<String>((Mybean p) =>p.a, i, b);}),
              DataColumn(label:Text('姓名'),onSort: (i,b){_sort<String>((Mybean p) =>p.b, i, b);}),
              DataColumn(label:Text('性别'),onSort: (i,b){_sort<String>((Mybean p) =>p.c, i, b);}),
              DataColumn(numeric:true,label:Text('年龄'),onSort: (i,b){_sort((Mybean p) =>p.d, i, b);}),
            ],
            source: table,
          ),
        ],
      ),
    );
  }
}

getDate(){
  List<Mybean> list = List<Mybean>();
  for(int i = 0; i < 50; i++){
    String sex = Random().nextInt(2) > 0 ? '男' : '女';
    list.add(Mybean('高三五班','学生${i + 1}',sex,Random().nextInt(3) + 15));
  }
  return list;
}


class MyTable extends DataTableSource{
  //获取数据集合
  List<Mybean> dataList = getDate();

  int _selectCount=0;//当前选中的行数
  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
    if (index >= dataList.length || index < 0) throw FlutterError('兄弟，取错数据了吧');
    //如果索引不在商品列表里面，抛出一个异常
    final Mybean bean = dataList[index];
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(Text('${bean.a}')),
          DataCell(Text('${bean.b}')),
          DataCell(Text('${bean.c}')),
          DataCell(Text('${bean.d}')),
        ],
        selected: bean.selected,
        index: index,
        onSelectChanged: (isSelected) {
          selectOne(index, isSelected);
        }
    );

  }
  @override//是否行数 不确定
  bool get isRowCountApproximate => false;

  @override//有多少行
  // int get rowCount => dataList.length;
  int get rowCount => dataList.length;

  @override//选中的行数
  int get selectedRowCount => _selectCount;

  //选中单个
  void selectOne(int index,bool isSelected){
    final Mybean bean = dataList[index];
    if (bean.selected != isSelected) {
      //如果选中就选中数量加一，否则减一
      _selectCount = _selectCount += isSelected ? 1 : -1;
      bean.selected = isSelected;
      //更新
      notifyListeners();
    }
  }
  //选中全部   选中所有数据， 不使用此方法点击全选 累加 当前页面所有
  void selectAll(bool checked) {
    for (Mybean bean in dataList) {
      bean.selected = checked;
    }
    _selectCount = checked ? dataList.length : 0;
    notifyListeners(); //通知监听器去刷新
  }
  //排序,
  void _sort<T>(Comparable<T> getField(Mybean shop),bool b){
    dataList.sort((Mybean s1,Mybean s2){
      if(b){//两个项进行交换
        final Mybean temp=s1;
        s1=s2;
        s2=temp;
      }
      final Comparable<T> s1Value=getField(s1);
      final Comparable<T> s2Value=getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}

class Mybean {
  final String a;
  final String b;
  final String c;
  final int d;
  bool selected = false; //默认为未选中
  Mybean(
      this.a,
      this.b,
      this.c,
      this.d,
      );
}