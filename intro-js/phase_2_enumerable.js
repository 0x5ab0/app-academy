const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function(callback) {
    for (i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

NUMS.myEach((num) => {
    console.log(`The square of ${num} is ${num * num}.`)
})

Array.prototype.myMap = function(callback) {
    const mappedArray = [];

    this.myEach( el => mappedArray.push(callback(el)) );

    return mappedArray;
}

console.log(NUMS.myMap( num => num * num ));

Array.prototype.myReduce = function(callback, initialValue) {
    let arr = this;

    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1);
    }

    let result = initialValue;

    arr.myEach( el => result = callback(result, el) );

    return result;
}

withoutInitialValue = [1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
}); // => 6
  
withInitialValue = [1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
}, 25); // => 31

console.log(withoutInitialValue)
console.log(withInitialValue)