#ʹ��python���������� �žų˷��� ��Ƶ��ʾ�̳�
print('Content-type: text/html\n')
for i in range(1,10):
	for j in range(1,i+1):
		print("%d*%d=%d" % (j,i,j*i), end="&nbsp; ")
	print("<br>")