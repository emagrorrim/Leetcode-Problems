/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
    let maxLength = 0;
    let head = 0;
    let map = {};
    for (let i = 0; i < s.length; i++) {
        const char = s[i];
        const lastPosition = map[char];
        map[char] = i;
        const length = i - head + 1;
        if (lastPosition >= head) {
            maxLength = Math.max(length - 1, maxLength);
            head = lastPosition + 1;
            continue;
        }
        maxLength = Math.max(length, maxLength);
    }
    return maxLength;
};

describe("lengthOfLongestSubstring(s)", () => {
    describe("given input: `pwwkew`", () => {
        it("returns 3", () => {
            expect(lengthOfLongestSubstring("pwwkew")).toEqual(3);
        });
    });

    describe("given input: `abcabcbb`", () => {
        it("returns 3", () => {
            expect(lengthOfLongestSubstring("abcabcbb")).toEqual(3);
        });
    });

    describe("given input: `bbbbb`", () => {
        it("returns 1", () => {
            expect(lengthOfLongestSubstring("bbbbb")).toEqual(1);
        });
    });

    describe("given input: ` `", () => {
        it("returns 1", () => {
            expect(lengthOfLongestSubstring(" ")).toEqual(1);
        });
    });

    describe("given input: `tmmzuxt`", () => {
        it("returns 5", () => {
            expect(lengthOfLongestSubstring("tmmzuxt")).toEqual(5);
        });
    });
});