//使用nodejs语言来开发 数据库增删改查
var http = require('http');
var querystring = require('querystring');
var url = require('url');
var mysql = require('mysql'); 

http.createServer(function(req, res) {
	res.writeHead(200, {
		'Content-Type': 'text/html;charset=utf-8'
	});
	var postData = "";
	req.on('data', function(chunk) {
		postData += chunk;
	});
	req.on('end', function() {
		var get = url.parse(req.url, true).query;
		var post = querystring.parse(postData);
		var act = get.act;
		var id = get.id;
		var uname = post.uname;
		var btnTitle = "添加";
		if (uname == undefined) {
			uname = ""
		}
		if (id == undefined) {
			id = ""
		}
		if (id != "") {
			btnTitle = "修改"
		}

		var connection = mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: 'root',
			database: 'testdba1'
		});
		//res.write("<hr>id=" + id + "<hr>act=" + act + "<hr>uname="+uname+"<hr>")

		connection.connect();
		//connection.query("INSERT INTO testTable (uname) VALUES ('aabb')"); 
		if (act == "addEdit") {
			var sql = "UPDATE testTable set uname='" + uname + "' where id=" + id
			if (id == "") {
				sql = "INSERT INTO testTable (uname) VALUES ('" + uname + "')"
			}
			connection.query(sql);
			res.write(btnTitle + "成功<hr>")

		} else if (act == "showEdit") { 
			connection.query('SELECT * FROM testtable where id=' + id, function(err, rows) {
				if (err) {
					console.log('[SELECT ERROR] - ', err.message);
					return;
				} 
				uname = rows[0].uname; 
			}); 
		} else if (act == "del") {
			connection.query("delete from testTable where id=" + id);
			res.write("删除成功<hr>")
		}
		connection.query('SELECT * FROM testtable', function(err, rows) {
			if (err) {
				console.log('[SELECT ERROR] - ', err.message);
				return;
			} 
			res.write("<a href=?act=showAdd>添加一条新的</a>");
			res.write("<table width=100% border=1 cellspacing=0 cellpadding=0><tr><td>ID</td><td>姓名</td><td>操作</td></tr>"); 
			for (var i in rows) {
				var sId = rows[i].id;
				res.write("<tr><td>" + sId + "</td><td>" + rows[i].uname + "</td>");
				res.write("<td><a href=?act=showEdit&id=" + sId + ">修改</a> | <a href=?act=del&id=" + sId + ">删除</a></td></tr>");
			}
			res.write("</table>");

			if (act == "showAdd" || act == "showEdit") {
				res.write("<form method='post' action='?act=addEdit&id=" + id + "'>姓名");
				res.write("<input type='text' id='uname' name='uname' value='" + uname + "'><input type='submit' value='" + btnTitle + "' ></form>");
			}

		}); 
	}); 
}).listen(3000, function() {
	console.log("listen on port 3000");
}); 



