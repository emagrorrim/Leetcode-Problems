/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
    const chars = s.split('');
    let maxLength = 0;
    let head = 0;
    let map = {};
    for (let i = 0; i < chars.length; i++) {
        const char = chars[i];
        if (map[char] != undefined) {
            const length = i - head;
            maxLength = Math.max(length, maxLength);
            const origin = head;
            head = map[char] + 1;
            for (let j = origin; j < head; j++) {
              const c = chars[j];
              map[c] == undefined;
            }
        } else {
            const length = i - head + 1;
            maxLength = Math.max(length, maxLength);
        }
        map[char] = i;
    }
    return maxLength;
};

describe("lengthOfLongestSubstring(s)", () => {
    xdescribe("given input: `pwwkew`", () => {
        it("returns 3", () => {
            expect(lengthOfLongestSubstring("pwwkew")).toEqual(3);
        });
    });

    xdescribe("given input: `abcabcbb`", () => {
        it("returns 3", () => {
            expect(lengthOfLongestSubstring("abcabcbb")).toEqual(3);
        });
    });

    xdescribe("given input: `bbbbb`", () => {
        it("returns 1", () => {
            expect(lengthOfLongestSubstring("bbbbb")).toEqual(1);
        });
    });

    xdescribe("given input: ` `", () => {
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