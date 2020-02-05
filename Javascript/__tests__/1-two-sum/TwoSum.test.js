/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = function (nums, target) {
    let hashMap = {};
    for (let i = 0; i < nums.length; i++) {
        const num = nums[i];
        if (hashMap[num] !== undefined) {
            return [hashMap[num], i];
        }

        const anotherNumber = target - num;
        hashMap[anotherNumber] = i;
    }
};

describe("twoSum(nums, target)", () => {
    describe("given nums = [2, 7, 11, 15], target = 9", () => {
        it("returns [0, 1]", () => {
            const nums = [2, 7, 11, 15];
            const target = 9;
            const expectedResult = [0, 1];
            expect(twoSum(nums, target)).toEqual(expectedResult);
        });
    });
});