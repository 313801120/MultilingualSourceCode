var pubID = "";
//默认创建数据库
var db = openDatabase('testDB', '1.0', 'Test DB', 2 * 1024 * 1024);
var msg;
db.transaction(function(context) {
	context.executeSql('CREATE TABLE IF NOT EXISTS testTable (id unique, name)');
	context.executeSql('INSERT INTO testTable (id, name) VALUES (0, "喜悦TA")');
	context.executeSql('INSERT INTO testTable (id, name) VALUES (1, "313801120")');
	context.executeSql('INSERT INTO testTable (id, name) VALUES (2, "xiyueta")');
});
showData()
document.getElementById("addEditDialogLayout").style.display = "none"

//提交添加修改
function submitAddEdit() {
	var butTitle = pubID == "" ? "确认添加" : "确认修改";
	var name = document.getElementById('name').value
	if (pubID != "") {
		editData(pubID, name)
	} else {
		addData(name)
	}
	alert(butTitle + "成功")
	showData()
}
//显示添加修改界面
function showAddEditLayout(id) {
	var butTitle = ""
	if (id == "" || id == undefined) {
		butTitle = "添加"
		pubID = "" 
	} else {
		pubID = id
		butTitle = "修改"

		db.transaction(function(context) {
			context.executeSql('SELECT * FROM testTable where id=' + id, [], function(context, results) {
				document.getElementById('name').value = results.rows.item(0).name
			});
		});


	}
	document.getElementById('addEditDialogLayout').style.display = ''
	document.getElementById('button').innerHTML = "确认"+butTitle
}
//显示列表
function showData() {
	db.transaction(function(context) {
		context.executeSql('SELECT * FROM testTable', [], function(context, results) {
			var len = results.rows.length,
				i, id;
			//console.log('Got '+len+' rows.');
			var s = "",
				c = "<table width='100%' border='1' cellspacing='0' cellpadding='0'>";
			c += "<tr><td>ID</td><td>姓名</td><td>操作</td></tr>"
			for (i = 0; i < len; i++) {
				id = results.rows.item(i).id
				name = results.rows.item(i).name
				s = "<a href=\"javascript:showAddEditLayout('" + id + "')\" title='" + id + "' class='edit'>修改</a> | <a href='javascript:delData(" + id + ");' title='" + id + "' class='del'>删除</a>"
				c += "<tr><td>" + id + "</td><td>" + name + "</td><td>" + s + "</td></tr>"



			}
			c += "</table>"
			document.getElementById("showData").innerHTML = c;



			var a = document.getElementsByTagName("a")
			for (var i = 0; i <= a.length; i++) {
				var oBtn = a[i]
				oBtn.onclick = function(e) {
					var s = this.innerHTML 
					if (s == "添加一条新的") {
						showAddEditLayout('');
					} else if (s == "确认添加") {
						submitAddEdit()
					} else if (s == "确认修改") {
						submitAddEdit() 
					} else if (s == "修改") {
						showAddEditLayout(this.title)
					} else if (s == "删除") {
						delData(this.title)

					}
				};
			}

		});
	});
	return "";
}
//添加记录
function addData(val) {
	db.transaction(function(context) {
		context.executeSql('SELECT * FROM testTable order by id desc', [], function(context, results) {
			var len = results.rows.length
			if (results.rows.length > 0) {
				var id = results.rows.item(0).id + 1
				db.transaction(function(context) {
					context.executeSql("INSERT INTO testTable (id, name) VALUES (" + id + ",'" + val + "')");
					showData()
				});
			}
		});
	});

}
//修改记录
function editData(id, val) {
	db.transaction(function(context) {
		context.executeSql("UPDATE testTable set name='" + val + "' where id=" + id);
	});
}
//删除记录
function delData(id) {
	db.transaction(function(context) {
		context.executeSql('delete FROM testTable where id=' + id);
		alert("删除ID（" + id + "）成功")
		showData()
	});
}