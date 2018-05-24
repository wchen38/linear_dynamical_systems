import xlsxwriter, matplotlib.pyplot as plt, numpy, decimal
from array import array

# pandas, openpyxl

#plt.plot(x,y)
#plt.show()

aTuple = [0.002312321312312321, 1.56643295288, 1.56643295288, 1.56643295288];
aList = list(aTuple)
print "List elements : ", float("0.002312321312312321111")
#create workbook and worksheet
#workbook = workbook = xlsxwriter.Workbook('Expenses03.csv')
#worksheet = workbook.add_worksheet()
xAxis = numpy.arange(-1.57079637051,1.56643295288,0.00436332309619)
#plt.plot(xAxis, xAxis)
#plt.show()

print len(xAxis)

row = 0
col = 0
arr = array('f')
with open('lidar_data.txt', 'r') as infile:
	#scans each line of the file to look for keywords
	for line in infile:
		
		#detect the key word range, which is the data I want to parse.
		if 'ranges:' in line:
			
			#strip away all unwanted characters
			range_data = line.strip('ranges: ').replace('[', '').replace(']\n', '').replace(',','').replace('\r\n', '').replace('\r', '')
			
			#store all the data seperated by a space in an array
			for word in range_data.split(" "):	
				arr.append(float(word.strip()))
				#print arr
				#break;
			plt.plot(xAxis, arr)
			plt.show()
			break
			
			
			

#workbook.close()
#wbk.save('pared_data.xls')

	#list_float = numpy.array(range_data).astype(numpy.float)
		#	#print "List elements : ", list_float
		#	print len(xAxis)
		#	print len(range_data)
		#	plt.plot(xAxis, list(range_data))
		#plt.show()
