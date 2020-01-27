/**
 * @param {string} str
 * @return {number}
 */
const MAX_POSITIVE_INT32 = 0x7FFFFFFF;
const MIN_NEGATIVE_INT32 = -0x80000000;

const myAtoi = (str) => {
    let end = 0;
    let stringNumber = str.trim();
    if ((stringNumber.startsWith("-") || stringNumber.startsWith("+")) && isNaN(parseInt(stringNumber[1]))) {
        return 0
    }
    while(end < stringNumber.length) {
        if ((stringNumber[end] === "-" || stringNumber[end] === "+")  && 0 === end || !isNaN(parseInt(stringNumber[end]))) {
            end++;
        } else {
            break;
        }
    }
    const number = stringNumber.slice(0, end);
    if (number > MAX_POSITIVE_INT32) { return MAX_POSITIVE_INT32; }
    if (number < MIN_NEGATIVE_INT32) { return MIN_NEGATIVE_INT32; }
    return 0 === end ? 0 : parseInt(stringNumber.slice(0, end));
};

describe("myAtoi", () => {
    describe("\"words and 987\"", () => {
        it("returns 0", () => {
            expect(myAtoi("words and 987")).toEqual(0);
        });
    });

    describe("\"4193 with words\"", () => {
        it("returns 4193", () => {
            expect(myAtoi("4193 with words")).toEqual(4193);
        });
    });

    describe("\"   -42\"", () => {
        it("returns -42", () => {
            expect(myAtoi("   -42")).toEqual(-42);
        });
    });

    describe("\"   +42\"", () => {
        it("returns 42", () => {
            expect(myAtoi("   +42")).toEqual(42);
        });
    });

    describe("\"+\"", () => {
        it("returns 0", () => {
            expect(myAtoi("+")).toEqual(0);
        });
    });

    describe("\"-91283472332\"", () => {
        it("returns 0", () => {
            expect(myAtoi("-91283472332")).toEqual(-2147483648);
        });
    });
});