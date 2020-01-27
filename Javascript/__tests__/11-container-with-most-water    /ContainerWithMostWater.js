/**
 * @param {number[]} height
 * @return {number}
 */
const maxArea = (height) => {
    let maxArea = 0;
    let left = 0;
    let right = height.length - 1;

    while (left < right) {
        const leftHeight = height[left];
        const rightHeight = height[right];
        maxArea = Math.max(maxArea, (right - left) * Math.min(leftHeight, rightHeight));
        leftHeight < rightHeight ? left++ : right--;
    }

    return maxArea;
};

describe("maxArea", () => {
    describe("[1,8,6,2,5,4,8,3,7]", () => {
       it("return 49", () => {
           expect(maxArea([1,8,6,2,5,4,8,3,7])).toEqual(49);
       });
    });
});