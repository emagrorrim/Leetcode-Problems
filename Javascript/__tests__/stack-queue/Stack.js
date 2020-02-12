class Stack {
  constructor() {
    this._storage = [];
  }

  push(val) {
    return this._storage.push(val);
  }

  pop() {
    return this._storage.pop();
  }

  peek() {
    const length = this._storage.length;
    return length > 0 ? this._storage[length - 1] : null;
  }

  top() {
    return this.peep();
  }

  empty() {
    return this._storage.length === 0;
  }

  size() {
    return this._storage.length;
  }
}