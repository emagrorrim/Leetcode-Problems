/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
    let cache = {};
    let max = Number.MIN_SAFE_INTEGER;
    for (let i = 0; i < nums.length; i++) {
        max = Math.max(_maxSubArrayFromEnd(nums, i, cache), max);
    }
    return max;
};

const _maxSubArrayFromEnd = (nums, k, cache) => {
    if (cache[k] !== undefined) { return cache[k]; }
    if (k === 0) { return nums[k]; }
    const last = _maxSubArrayFromEnd(nums, k - 1, cache);
    const result = nums[k] + (last <= 0 ? 0 : last);
    cache[k] = result;
    return result;
};

describe("maxSubArray", () => {
    describe("[-2,1,-3,4,-1,2,1,-5,4]", () => {
        it("returns 6", () => {
            expect(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])).toEqual(6);
        });
    });
});
