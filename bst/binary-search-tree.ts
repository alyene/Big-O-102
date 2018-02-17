class BSTree<T> {
  private root: BSTreeNode<T> | null;

  constructor (root?: BSTreeNode<T>) {
    this.root = root || null;
  }

  static from<U> (vals: U[]): BSTree<U> {
    const tree = new BSTree<U>();
    vals.forEach(val => tree.insert(val));
    return tree;
  }

  public insert (val: T): this {
    const { root } = this;

    if (!root) {
      this.root = new BSTreeNode(val);
    } else if (val < root.val) {
      this.insertLeft(val);
    } else {
      this.insertRight(val);
    }

    return this;
  }

  public traverse(callback: (val: T) => any): void {
    const left = this.leftTree();
    const right = this.rightTree();
    const root = this.root;

    left && left.traverse(callback);
    root && callback(root.val);
    right && right.traverse(callback);
  }

  public includes(val: T): boolean {
    const { root } = this;

    if(!root) { return false; }

    if (val < root.val) {
      return this.includesLeft(val);
    } else if (val > root.val) {
      return this.includesRight(val);
    } else {
      return true;
    }
  }

  public toArray (): T[] {
    const arr: T[] = [];
    this.traverse(val => arr.push(val));
    return arr;
  }

  private includesLeft(val: T): boolean {
    const left = this.leftTree();
    return left ? left.includes(val) : false;
  }

  private includesRight(val: T): boolean {
    const right = this.rightTree();
    return right ? right.includes(val) : false;
  }

  private leftTree (): BSTree<T> | null {
    return this.root && this.root.left && new BSTree(this.root.left);
  }

  private rightTree (): BSTree<T> | null {
    return this.root && this.root.right && new BSTree(this.root.right);
  }

  private insertLeft(val: T): void {
    const left = this.leftTree();
    if (left) {
      left.insert(val);
    } else {
      this.root && (this.root.left = new BSTreeNode(val));
    }
  }

  private insertRight(val: T): void {
    const right = this.rightTree();
    if (right) {
      right.insert(val);
    } else {
      this.root && (this.root.right = new BSTreeNode(val));
    }
  }
}

class BSTreeNode<T> {
  public val: T;
  public left: BSTreeNode<T> | null;
  public right: BSTreeNode<T> | null;

  constructor (val: T) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

// playground
const tree = BSTree.from([7,4,5,2,8,1,9,0,6,3]);
tree.traverse(console.log); // => logs numbers in order
tree.toArray(); // => array of numbers in order
tree.includes(5); // => true
tree.includes(11); // => false
