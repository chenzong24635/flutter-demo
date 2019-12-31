import "package:flutter/material.dart";

class TextFieldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField'),),
      body: TextFieldBox()
    );
  }
}

class TextFieldBox extends StatefulWidget {
  @override
  _TextFieldBoxState createState() => new _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context){
    return  ListView(
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20.0,color:Colors.white),
          // autofocus: true, // 是否自动获取焦点
          keyboardType: TextInputType.phone, //输入框默认的键盘输入类型
          textInputAction: TextInputAction.newline, // 回车键位图标
          obscureText: false, //是否隐藏正在编辑的文本，会用“•”替换内容(一般用于密码)
          maxLines: 2, //输入框最大行数
          maxLength: 12, //输入框最大长度
          maxLengthEnforced: false, //当超过最大长度时，是否可以继续输入(此时输入框会变红)
          enabled: true	,	//输入框是否可用
          cursorColor: Colors.red,	//光标颜色
          cursorWidth: 12.0,	//光标宽度
          cursorRadius: Radius.circular(10),	//光标圆角
          decoration: InputDecoration( // 控制TextField的外观显示
            labelText: "用户名", //输入框标题
            labelStyle: TextStyle(color:Colors.orange), //输入框的标题样式
            hintText: "用户名或邮箱", //输入框提示 placeholder
            hintStyle: TextStyle(color:Colors.greenAccent), //输入框提示样式
            errorText: '请填写正确的用户名或邮箱', // 输入框的错误提示
            errorStyle: TextStyle(color:Colors.greenAccent), //输入框的错误提示样式
            // counterText: '字数计数器', // 输入框的字数计数器文字
            // counterStyle: TextStyle(color:Colors.greenAccent), //输入框的字数计数器文字样式
            contentPadding: EdgeInsets.all(50), // 输入框padding
            filled: true, // 输入框区域是否填充颜色
            fillColor: Colors.orange, // 输入框区域的填充颜色
            // border: OutlineInputBorder(), // 输入框边框设置
            border: InputBorder.none,   // 输入框边框去除
            icon: Icon(Icons.person), // 输入框前面的图标
            suffixIcon: Icon(Icons.phone_android), // 输入框后面的图标
            prefixIcon: Icon(Icons.phone_bluetooth_speaker), // 输入框区域前的图标
            /* enabledBorder: UnderlineInputBorder(// 未获得焦点下划线设为灰色
              borderSide: BorderSide(color: Colors.blue),
            ), */
            focusedBorder: UnderlineInputBorder(//获得焦点下划线设为蓝色
              borderSide: BorderSide(color: Colors.black,width:30.0),
            ),
          ),
          focusNode: focusNode1,//关联focusNode1 //控制TextField是否占有当前键盘的输入焦点
          // controller: , //用于和输入框交互，获取输入内容
          // onChanged:		//输入框内容改变时的回调函数
          // onEditingComplete	(){},	//输入完成时触发，不能接收输入内容
          // onSubmitted	(String){},	//输入完成时触发，接收输入内容
          // inputFormatters,		//指定输入格式；当用户输入内容改变时，会根据指定的格式来校验
          // onTap	GestureTapCallback,	//当用户点击输入框时触发
        ),
        TextField(
          focusNode: focusNode2,//关联focusNode2
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        ),
        Padding(
          child: Text('TextFormField-相比于 TextField，主要多了 validator 可以校验'),
          padding: EdgeInsets.fromLTRB(0,50,0,10)
        ),
        TextFormField (
          validator: (v){
            return v.trim().length > 0 ? null : "不能为空";
          },
          decoration: InputDecoration(
            labelText: "这是个TextFormField Widget",
            hintText: "TextFormField Widget",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起  
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}