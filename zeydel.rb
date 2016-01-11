def sum(n)
	r = 0
	for i in (0...n)
		r += yield(i)
	end
	return r
end

class Array
	def rate
		sum(self.size){|i| self[i].abs}
	end
end
a = [
	[40.0,  5.0,  3.0],
	[ 9.0, 12.0,  1.0],
	[ 4.0, 23.0, 30.0]
]
b = [1.0, 2.0, 3.0]

# a = [
# 	[10.0,  2.0,  1.0],
# 	[ 1.0, 10.0,  2.0],
# 	[ 1.0,  1.0, 10.0]
# ]
b = [10.0, 12.0, 8.0]
x = Array.new(b)
n = b.size
e = 0.0001
last = Array.new(n){0}
while Array.new(n){|i| (x[i] - last[i]).abs}.rate >= e
	last = Array.new(x)
	for i in (0...n)
		x[i] = -(sum(n){|j| a[i][j] * x[j]} - a[i][i] * x[i] - b[i]) / a[i][i]
	end
	# p x
	p Array.new(n){|i| (x[i] - last[i]).abs}
end
p x



