class Element {
  constructor(val, key) {
    this.val = val;
    this.key = key;
  }
}

class PriorityQueue {  
  constructor() {
    this._maxHeap = new MaxHeap();
  }

  add(val, priority) {
    this._maxHeap.add(val, priority);
    return this.maxHeap.top();
  }
}

class MaxHeap {
  constructor() {
    this._storage = [];
  }

  top() {
    return this._storage[0];
  }

  add(val, key) {
    const element = new Element(val, key || val);
    this._storage.push(element);
    if (this._storage.length == 1) {
      return;
    }
    this._maintain();
  }

  delete() {
    if (this._storage.length == 0) { return; }
    this._swap(0, this._storage.length - 1);
    this._storage.pop();
    let index = 0;
    while (index < this._storage.length) {
      const left = 2 * index + 1;
      const right = 2 * index + 2;
      let max = index;
      if (this._storage[left] && this._storage[left].val > this._storage[max].val) {
        max = left;
      }
      if (this._storage[right] && this._storage[right].val > this._storage[max].val) {
        max = right;
      }
      if (max == index) {
        return;
      } else {
        this._swap(max, index);
        index = max;
      }
    }
  }

  _swap(index1, index2) {
    if (this._storage[index1] && this._storage[index2]) {
      const temp = this._storage[index1];
      this._storage[index1] = this._storage[index2];
      this._storage[index2] = temp;
    }
  }

  _maintain() {
    let index = this._storage.length - 1;
    while (index != 0) {
      const parentIndex = parseInt((index - 1) / 2);
      if (this._storage[index].key > this._storage[parentIndex].key) {
        this._swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }
}

class MinHeap {
  constructor() {
    this._storage = [];
  }

  top() {
    return this._storage[0];
  }

  add(val, key) {
    const element = new Element(val, key || val);
    this._storage.push(element);
    if (this._storage.length == 1) {
      return;
    }
    this._maintain();
  }

  delete() {
    if (this._storage.length == 0) { return; }
    this._swap(0, this._storage.length - 1);
    this._storage.pop();
    let index = 0;
    while (index < this._storage.length) {
      const left = 2 * index + 1;
      const right = 2 * index + 2;
      let min = index;
      if (this._storage[left] && this._storage[left].val < this._storage[min].val) {
        min = left;
      }
      if (this._storage[right] && this._storage[right].val < this._storage[min].val) {
        min = right;
      }
      if (min == index) {
        return;
      } else {
        this._swap(min, index);
        index = min;
      }
    }
  }

  _swap(index1, index2) {
    if (this._storage[index1] && this._storage[index2]) {
      const temp = this._storage[index1];
      this._storage[index1] = this._storage[index2];
      this._storage[index2] = temp;
    }
  }

  _maintain() {
    let index = this._storage.length - 1;
    while (index != 0) {
      const parentIndex = parseInt((index - 1) / 2);
      if (this._storage[index].key < this._storage[parentIndex].key) {
        this._swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }
}

describe("MaxHeap", () => {
  let maxHeap;
  beforeEach(() => {
    maxHeap = new MaxHeap();
  });

  describe("add", () => {
    it("", () => {
      maxHeap.add(2);
      maxHeap.add(3);
      maxHeap.add(4);
      maxHeap.add(2);
      maxHeap.add(9);
      maxHeap.add(7);
      maxHeap.add(3);
      maxHeap.add(5);
      expect(maxHeap.top().val).toEqual(9);
      maxHeap.delete();
      expect(maxHeap.top().val).toEqual(7);
      maxHeap.delete();
      expect(maxHeap.top().val).toEqual(5);
    }); 
  });
});

describe("MinHeap", () => {
  let minHeap;
  beforeEach(() => {
    minHeap = new MinHeap();
  });

  describe("add", () => {
    it("", () => {
      minHeap.add(2);
      minHeap.add(3);
      minHeap.add(4);
      minHeap.add(2);
      minHeap.add(9);
      minHeap.add(7);
      minHeap.add(3);
      minHeap.add(5);
      console.log(minHeap._storage);
      expect(minHeap.top().val).toEqual(2);
      minHeap.delete();
      expect(minHeap.top().val).toEqual(2);
      minHeap.delete();
      expect(minHeap.top().val).toEqual(3);
      console.log(minHeap._storage);
    });
  });
});