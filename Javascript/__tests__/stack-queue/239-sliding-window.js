Array.prototype.last = function () {
    return this[this.length - 1];
}

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function (nums, k) {
    const window = [];
    const result = [];
    for (let i = 0; i < nums.length; ++i) {
        if (i >= k && window[0] + k == i) {
            window.shift();
        }
        while (window.length > 0 && nums[window.last()] < nums[i]) {
            window.pop();
        }
        window.push(i);
        if (i >= k - 1) {
            result.push(nums[window[0]]);
        }
        console.log(window);
    }
    return result;
};

describe("", () => {
    it("", () => {
        maxSlidingWindow([1, -1], 1);
    });
});
