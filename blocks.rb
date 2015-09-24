# SUM_IF

def sum_if(arr)
  sum = 0
  arr.each do |x|
    if yield(x)
      sum += x
    end
  end
end

sum_if([1,2,3,4,5]) do |x|
  x % 2 == 0
end



# REDUCE (implemented from scratch)

def reduce(arr, init=nil)
  memo = init || arr.first
  start = init ? 0 : 1
  arr[start,arr.length].each do |i|
    memo = yield(memo,i)
  end
  return memo
end

reduce([1,2,3,4],0) do |sum,x|
  sum + x
end








