require "matrix"

def collisions_2d(x1,v1,m1,x2,v2,m2)
# X1 = Vector[0, 100]
# V1 = Vector[10,0]
# m1 = 20.to_f
# X2 = Vector[100, 0]
# V2 = Vector[0,10]
# m1 = 10.to_f

m2 = m2.to_f
m1 = m1.to_f


@V1f = v1 - 2 * m2 / (m1+m2) * (((v1-v2).inner_product (x1-x2))/(x1-x2).magnitude**2)*(x1-x2)
@V2f = v2 - 2 * m1 / (m1+m2) * (((v2-v1).inner_product (x2-x1))/(x2-x1).magnitude**2)*(x2-x1)
return @V1f,@V2f
# puts @V1f
# puts @V2f
end

# # collisions_2d(0,100,10,0,20,100,0,0,10,10)
# x1 = Vector[0, 100]
# v1 = Vector[10,0]
# m1 = 20
# x2 = Vector[100, 0]
# v2 = Vector[0,10]
# m2 = 10
# out = collisions_2d(x1,v1,m1,x2,v2,m2)
#
# puts out[0]
