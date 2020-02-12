/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function (s) {
  let stack = [];
  let lefts = ['(', '[', '{'];
  let rights = {
    ')': '(',
    ']': '[',
    '}': '{'
  };
  for (char in s) {
    if (lefts.includes(char)) {
      stack.push(char);
    } else if (Object.keys(rights).includes(char)) {
      if (stack.pop() != rights[char]) {
        return false;
      }
    }
  }
  return stack.length === 0;
};
