// Intro to JS Homework

// Phase I - JS Fundamentals

console.log('---')

// 1.1. Mystery Scoping

function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
}

mysteryScoping1() // in block, in block
  
function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';  
        console.log(x);
    }
    console.log(x);
}

mysteryScoping2() // in block, out of block

// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//         var x = 'in block';  
//         console.log(x);
//     }
//     console.log(x);
// }

// mysteryScoping3() // SyntaxError

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';  
        console.log(x);
    }
    console.log(x);
}

mysteryScoping4() // in block, out of black

// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//         let x = 'in block';  
//         console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
// }

// mysteryScoping5 // SyntaxError

console.log('---')

// 1.2. madLib

function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

console.log(madLib('make', 'best', 'guac')) // We shall MAKE the BEST GUAC.
console.log(madLib('write', 'ultimate', 'code')) // We shall WRITE the ULTIMATE CODE.

console.log('---')

// 1.3. isSubstring

function isSubstring(searchString, subString) {
    return searchString.includes(subString)
}

console.log(isSubstring("time to program", "time")) // true
console.log(isSubstring("Jump for joy", "joys")) // false

console.log('---')

// Phase II - JS Looping Constructs

// fizzBuzz

function fizzBuzz(array) {
    const new_array = []
    
    array.forEach(el => {
        if ((el % 3 == 0) ^ (el % 5 == 0)) {
            new_array.push(el)
        }
    })

    return new_array
}

console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))

console.log('---')

// isPrime

function isPrime(n) {
    if (n < 2) { return false }

    for (let i = 2; i < n; i++) {
        if (n % i == 0) {
            return false;
        }
    }

    return true
}

console.log(isPrime(2)) // true
console.log(isPrime(10)) // false
console.log(isPrime(15485863)) // true
console.log(isPrime(3548563)) // false

console.log('---')

// sumOfNPrimes

function firstNPrimes(n) {
    let primes = []

    let i = 0
    while (primes.length < n) {
        if (isPrime(i)) {
            primes.push(i)
        }
        i++
    }

    return primes
}

function sumOfNPrimes(n) {
    let primes = firstNPrimes(n)
    let sum = 0

    for (let i = 0; i < n; i++) {
        sum += primes[i]
    }

    return sum
}

console.log(sumOfNPrimes(0)) // 0
console.log(sumOfNPrimes(1)) // 2
console.log(sumOfNPrimes(4)) // 17

console.log('---')
