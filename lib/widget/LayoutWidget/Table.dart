import "package:flutter/material.dart";

import "./DataTable.dart";

//[参考](https://api.flutter.dev/flutter/widgets/Table-class.html)
/*
作用：表格布局
  高度，由其内容决定
  宽度，由columnWidths属性控制

继承关系：
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > Table

Table({
  TableBorder border //表格边框样式
  Map<int, TableColumnWidth>  columnWidths // 设置表格有多少列,并且指定列宽
  TableColumnWidth defaultColumnWidth //默认的每一列宽度值，默认情况下均分。
  TextDirection textDirection //列的排列方向
  TextBaseline  textBaseline //使用TableCellVerticalAlignment.baseline对齐行时要使用的文本基线
  TableCellVerticalAlignment defaultVerticalAlignment  //列的垂直方向对齐方式
  <TableRow>[] children,
})
*/

/* 
DataTable({
  List<DataColumn>  columns	//列的配置和标签 
  List<DataRow> rows //行的配置和标签 
  int sortColumnIndex	//排序的列
  bool sortAscending = true	//是否按升序排序
})

DataColumn(
  label	列标题
  tooltip	说明
  bool numeric = false	//该列是否表示数值数据
  onSort	用户要求使用此列对表进行排序时调用
)

DataRow(
  bool selected = false	//选中行
  onSelectChanged	选中行监听
  cells:[
    DataCell(
      bool placeholder = false	子组件是否实际上是占位符
      bool showEditIcon = false	单元格的末尾显示编辑图标
      onTap	点击
      child	
    )
  ]
)
*/

Widget table = Table(
  // textBaseline:  TextBaseline.alphabetic,
  columnWidths: const <int, TableColumnWidth>{
    //指定索引及固定列宽
    0: FixedColumnWidth(100.0),
    1: FixedColumnWidth(40.0),
    2: FixedColumnWidth(80.0),
    3: FixedColumnWidth(80.0),
  },
  border: TableBorder.all(
    color: Colors.red,
  ),
  children: [
    TableRow(
      children: [
        Text('data'),Text('data'),Text('data'),Text('data'),
      ]
    ),
    TableRow(
      children: [
        Text('data'),Text('data'),Text('data'),Text('data'),
      ]
    ),
    TableRow(
      children: [
        Text('data'),Text('data'),Text('data'),Text('data'),
      ]
    ),
  ],
);

Widget dataTable = DataTable(
  sortColumnIndex: 3,
  sortAscending: false,
  columns:[
    DataColumn(label:Text('单位'),),
    DataColumn(label:Text('姓名'),),
    DataColumn(label:Text('性别'),),
    DataColumn(numeric:true,label:Text('年龄'),),
    DataColumn(label:Text('婚配'),),
    DataColumn(label:Text('薪资'),),
  ],
  rows:[
    DataRow(
      cells:[
        DataCell(Text('物价局'),),
        DataCell(Text('张三'),),
        DataCell(Text('男'),),
        DataCell(Text('25'),),
        DataCell(Text('未婚'),),
        DataCell(Text('2500'),),
      ],
    ),
    DataRow(
      cells:[
        DataCell(Text('物价局'),),
        DataCell(Text('李四'),),
        DataCell(Text('男'),),
        DataCell(Text('30'),),
        DataCell(Text('未婚'),),
        DataCell(Text('2700'),),
      ],
    ),
    DataRow(
      cells:[
        DataCell(Text('看守所'),),
        DataCell(Text('王五'),),
        DataCell(Text('男'),),
        DataCell(Text('40'),),
        DataCell(Text('已婚'),),
        DataCell(Text('8000'),),
      ],
    ),
    DataRow(
      cells:[
        DataCell(Text('物价局'),),
        DataCell(Text('刘七'),),
        DataCell(Text('男'),),
        DataCell(Text('28'),),
        DataCell(Text('未婚'),),
        DataCell(Text('3000'),),
      ],
    ),
    DataRow(
      cells:[
        DataCell(Text('物价局'),),
        DataCell(Text('XYZ'),),
        DataCell(Text('女'),),
        DataCell(Text('25'),),
        DataCell(Text('未婚'),),
        DataCell(Text('3000'),),
      ],
    ),
  ],
);

class TablePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TableBox();
  }
}

class TableBox extends StatefulWidget{
  @override
  _TableBoxState createState() => _TableBoxState();
}
class _TableBoxState extends State<TableBox>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table'),),
      // body: dataTable,
      body: ListView(
        children: <Widget>[
          dataTable,
          OutlineButton(
            child: Text('更多'),
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => DataTablePage()));
            },
          )
        ],
      ),
    );
  }
}