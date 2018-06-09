import xlsxwriter, matplotlib.pyplot as plt, numpy, decimal, math
from array import array


#print("Hello World")





txtFile = raw_input('Enter .txt File Name: ')

start_angle = -1.57079637051
end_angle = 1.56643295288
dA = 0.00436332309619




row = 0
col = 0
fig = plt.figure()
fig.suptitle('cylindrical coordinate', fontsize=14, fontweight='bold')

ax = fig.add_subplot(111)
ax.set_xlabel('x')
ax.set_ylabel('y')
counter = 0;
plt.figure(1)
with open(txtFile, 'r') as infile:
	#scans each line of the file to look for keywords
	for line in infile:
		x = start_angle
		arr = array('f')
		arr_x = array('f')
		arr_y = array('f')
		#detect the key word range, which is the data I want to parse.
		if 'ranges:' in line:
			
			#strip away all unwanted characters
			range_data = line.strip('ranges: ').replace('[', '').replace(']\n', '').replace(',','').replace('\r\n', '').replace('\r', '')
			
			#store all the data seperated by a space in an array
			for word in range_data.split(" "):	
				arr.append( (float(word.strip())) )
				arr_x.append( (float(word.strip())) *math.cos(x) )
				arr_y.append( (float(word.strip())) *math.sin(x) ) 
				#print arr
				#break;
				x = x + dA
			xAxis = numpy.arange(start_angle,x,dA)
			counter+=1
			
			plt.subplot(211)
			plt.plot(xAxis, arr)
			plt.subplot(212)
			plt.plot(arr_y, arr_x)
	print x
	plt.show()
			#break
			
			
			

#workbook.close()
#wbk.save('pared_data.xls')

	#list_float = numpy.array(range_data).astype(numpy.float)
		#	#print "List elements : ", list_float
		#	print len(xAxis)
		#	print len(range_data)
		#	plt.plot(xAxis, list(range_data))
		#plt.show()
