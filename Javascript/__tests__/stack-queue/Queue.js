class Queue {
  constructor() {
    this._storage = [];
  }

  push(val) {
    const tempStack = [];
    while (this._storage.length > 0) {
      tempStack.push(this._storage.pop());
    }
    this._storage.push(val);
    while (tempStack.length > 0) {
      this._storage.push(tempStack.pop());
    }
  }

  pop() {
    return this._storage.pop();
  }

  peek() {
    const length = this._storage.length;
    return length > 0 ? this._storage[length - 1] : null;
  }

  empty() {
    return this._storage.length === 0;
  }

  size() {
    return this._storage.length;
  }
}
