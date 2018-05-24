import xlwt

#create workbook and worksheet
wbk = xlwt.Workbook()
sheet = wbk.add_sheet('range_parsed')
row = 0
col = 0
with open('lidar_data.txt', 'r') as f:
	for line in f:
		#print line
		if 'ranges:' in line:
			col = 0
			for word in line.split(" "):
				data = word.strip('ranges:').strip(',').strip('[').strip(']\n')
				print data
				#sheet.write(row,3,L)
				col+=1
			row +=1
			break

wbk.save('pared_data.xls')