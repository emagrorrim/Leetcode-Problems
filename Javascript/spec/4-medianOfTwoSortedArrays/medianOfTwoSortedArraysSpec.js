/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function(nums1, nums2) {
    const numbers = mergeOrderedArray(nums1, nums2);
    console.log(numbers);
    const length = numbers.length;
    return length % 2 == 0 ? (numbers[length / 2 - 1] + numbers[length / 2]) / 2 : numbers[(length - 1) / 2];
};

var mergeOrderedArray = (nums1, nums2) => {
    if (nums1.length == 0) { return nums2; }
    if (nums2.length == 0) { return nums1; }
    let numbers = [];
    let index1 = 0, index2 = 0
    while (index1 < nums1.length && index2 < nums2.length) {
        num1 = nums1[index1];
        num2 = nums2[index2];
        if (num1 < num2) {
            numbers.push(num1);
            index1++
        } else {
            numbers.push(num2);
            index2++;
        }
    }
    return numbers.concat(nums1.slice(index1), nums2.slice(index2));
}

fdescribe("findMedianSortedArrays(nums1, nums2)", () => {
    describe("given input: [1, 3] and [2]", () => {
        it("returns 2", () => {
            expect(findMedianSortedArrays([1, 3], [2])).toEqual(2);
        });
    });

    describe("given input: [1, 2] and [3, 4]", () => {
        it("returns 2", () => {
            expect(findMedianSortedArrays([1, 2], [3, 4])).toEqual(2.5);
        });
    });
});