"use strict";
var BSTree = /** @class */ (function () {
    function BSTree(root) {
        this.root = root || null;
    }
    BSTree.from = function (vals) {
        var tree = new BSTree();
        vals.forEach(function (val) { return tree.insert(val); });
        return tree;
    };
    BSTree.prototype.insert = function (val) {
        var root = this.root;
        if (!root) {
            this.root = new BSTreeNode(val);
        }
        else if (val < root.val) {
            this.insertLeft(val);
        }
        else {
            this.insertRight(val);
        }
        return this;
    };
    BSTree.prototype.traverse = function (callback) {
        var left = this.leftTree();
        var right = this.rightTree();
        var root = this.root;
        left && left.traverse(callback);
        root && callback(root.val);
        right && right.traverse(callback);
    };
    BSTree.prototype.includes = function (val) {
        var root = this.root;
        if (!root) {
            return false;
        }
        if (val < root.val) {
            return this.includesLeft(val);
        }
        else if (val > root.val) {
            return this.includesRight(val);
        }
        else {
            return true;
        }
    };
    BSTree.prototype.toArray = function () {
        var arr = [];
        this.traverse(function (val) { return arr.push(val); });
        return arr;
    };
    BSTree.prototype.includesLeft = function (val) {
        var left = this.leftTree();
        return left ? left.includes(val) : false;
    };
    BSTree.prototype.includesRight = function (val) {
        var right = this.rightTree();
        return right ? right.includes(val) : false;
    };
    BSTree.prototype.leftTree = function () {
        return this.root && this.root.left && new BSTree(this.root.left);
    };
    BSTree.prototype.rightTree = function () {
        return this.root && this.root.right && new BSTree(this.root.right);
    };
    BSTree.prototype.insertLeft = function (val) {
        var left = this.leftTree();
        if (left) {
            left.insert(val);
        }
        else {
            this.root && (this.root.left = new BSTreeNode(val));
        }
    };
    BSTree.prototype.insertRight = function (val) {
        var right = this.rightTree();
        if (right) {
            right.insert(val);
        }
        else {
            this.root && (this.root.right = new BSTreeNode(val));
        }
    };
    return BSTree;
}());
var BSTreeNode = /** @class */ (function () {
    function BSTreeNode(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
    return BSTreeNode;
}());
// playground
var tree = BSTree.from([7, 4, 5, 2, 8, 1, 9, 0, 6, 3]);
tree.traverse(console.log); // => logs numbers in order
tree.toArray(); // => array of numbers in order
tree.includes(5); // => true
tree.includes(11); // => false
