class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for i in range(len(nums)):
            x = target-nums[i]
            if x in nums[i+1:]:
                y = nums[i+1:]
                return [i, y.index(x)+i+1]
        