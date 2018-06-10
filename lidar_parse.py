import xlsxwriter, matplotlib.pyplot as plt, numpy, decimal, math
from array import array


#print("Hello World")





txtFile = raw_input('Enter .txt File Name: ')

start_angle = -1.57079637051
end_angle = 1.56643295288
dA = 0.00436332309619





index = 0
a_mat = numpy.ones(shape=(51, 3))
y_mat = numpy.ones(shape=(51, 1))
xc=0 #cylindrial form
yc=0 #cylindrial form

fig = plt.figure()
fig.suptitle('cylindrical coordinate', fontsize=14, fontweight='bold')

ax = fig.add_subplot(111)
ax.set_xlabel('x')
ax.set_ylabel('y')
sample_rate = 1;
SAMPLE_RANGE = 51

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
				xc = (float(word.strip())) *math.cos(x)
				yc = (float(word.strip())) *math.sin(x)
				arr_x.append(xc)
				arr_y.append(yc) 
				#print arr
				x = x + dA
				if sample_rate == SAMPLE_RANGE:
					break
				sample_rate+= 1;
			xAxis = numpy.arange(start_angle,x,dA)
			plt.subplot(211)
			plt.plot(xAxis, arr)
			plt.subplot(212)
			plt.plot(arr_y, arr_x)
			
			for row in range(len(arr_x)):
				for col in range(3):
					a_mat[row][col] =  a_mat[row][col] * arr_x[row];
				y_mat[row] = arr_x[row];
			break; #stop after one full scan 
			
	print y_mat
	print numpy.shape(a_mat) 
	print numpy.shape(y_mat)
	
	plt.show()
	
	
			
			
			

#workbook.close()
#wbk.save('pared_data.xls')

	#list_float = numpy.array(range_data).astype(numpy.float)
		#	#print "List elements : ", list_float
		#	print len(xAxis)
		#	print len(range_data)
		#	plt.plot(xAxis, list(range_data))
		#plt.show()
