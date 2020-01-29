/**
 * @param {number[]} nums
 * @return {number}
 */
const cache = {};

const rob = (nums) => {
    if (nums.length === 0) { return 0 }
    return _rob(nums, nums.length - 1);
};

const _rob = (nums, k) => {
    if (cache[k] !== undefined) { return cache[k]; }
    if (k === 1) { return Math.max(nums[1], nums[0]); }
    if (k === 0) { return nums[0]; }
    const robK = nums[k] + _rob(nums, k - 2);
    const doNotRobK = _rob(nums, k - 1);
    const maxMoney = robK > doNotRobK ? robK : doNotRobK;
    cache[k] = maxMoney;
    return maxMoney;
};

describe("rob", () => {
    describe("[114,117,207,117,235,82,90,67,143,146,53,108,200,91,80,223,58,170,110,236,81,90,222,160,165,195,187,199,114,235,197,187,69,129,64,214,228,78,188,67,205,94,205,169,241,202,144,240]", () => {
        it("returns 4173", () => {
            expect(rob([114,117,207,117,235,82,90,67,143,146,53,108,200,91,80,223,58,170,110,236,81,90,222,160,165,195,187,199,114,235,197,187,69,129,64,214,228,78,188,67,205,94,205,169,241,202,144,240])).toEqual(4173);
        });
    });

    describe("[2,7,9,3,1]", () => {
       it("returns 12", () => {
           expect(rob([2,7,9,3,1])).toEqual(12);
       });
    });
});