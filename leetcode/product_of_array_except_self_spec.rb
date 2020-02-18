# https://leetcode.com/problems/product-of-array-except-self/
# Runtime: 64 ms, faster than 83.43% of Ruby online submissions for Product of Array Except Self.
# Memory Usage: 13.1 MB, less than 100.00% of Ruby online submissions for Product of Array Except Self.

def product_except_self(nums)
    answer = Array.new(nums.size)
    leftprod, rightprod = 1, 1

    nums.size.times do |i|
        answer[i] = leftprod
        leftprod *= nums[i]
    end
# Ex: For nums.size = 4,
# answer[0] = 1
# answer[1] = nums[0]
# answer[2] = nums[0] * nums[1]
# answer[3] = nums[0] * nums[1] * nums[2]


    (nums.size - 2).downto(0).each do |i|
        rightprod *= nums[i + 1]
        answer[i] *= rightprod
    end
# answer[2] = answer[2] * nums[3]
# answer[1] = answer[1] * nums[2] * nums[3]
# answer[0] = answer[0] * nums[1] * nums[2] * nums[3]

    answer
end

describe "#product_except_self" do
  it 'gets product of all nums in array except num at that index' do
    expect(product_except_self([5, 6, 2, 10])).to eq [120,100,300,60]
    expect(product_except_self([1,2,3,4])).to eq [24,12,8,6]
  end
end
