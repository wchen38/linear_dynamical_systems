import xlsxwriter, pandas, openpyxl

#create workbook and worksheet
workbook = workbook = xlsxwriter.Workbook('Expenses03.csv')
worksheet = workbook.add_worksheet()

row = 0
col = 0
with open('lidar_data.txt', 'r') as f:
	for line in f:
		#print line
		if 'ranges:' in line:
			col = 0
			for word in line.split(" "):
				range_data = word.strip('ranges:').strip(',').strip('[').strip(']\n')
				#print range_data
				print col
				worksheet.write_string(row, col, range_data)
				col+=1
			row +=1
			print col
			#break

workbook.close()
#wbk.save('pared_data.xls')
