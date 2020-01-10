import "package:flutter/material.dart";

//[Form](https://api.flutter.dev/flutter/widgets/Form-class.html)
//[FormField](https://api.flutter.dev/flutter/widgets/FormField-class.html)
/*
作用：表单

继承：

构造函数：（类型 属性 = 默认值）
const Form({
  Key key,
  @required this.child,
  this.autovalidate = false,
  this.onWillPop,
  this.onChanged,
}) 
*/

// Form FormField TextFormField

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form表单基础用法'),
        ),
        body: FormBox());
  }
}

class FormBox extends StatefulWidget {
  @override
  _FormBoxState createState() => new _FormBoxState();
}

class _FormBoxState extends State<FormBox> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //用户名
  String userName;
  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = _formKey.currentState;

    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              // FormField
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),
                // 校验用户名
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
                //接收输入值
                onSaved: (value) {
                  userName = value;
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            login();
                          }
                        },
                        
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
