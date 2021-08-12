// Additional JS Intro Problems

// Phase I - Callbacks

// titleize

console.log('---')

function titleize(names, callback) {
    let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`)
    callback(titleized) 
}

titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
});

console.log('---')

// Phase II - Constructors, Prototypes, and 'this'

function Elephant(name, height, tricks) {
    this.name = name
    this.height = height
    this.tricks = tricks
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
}

Elephant.prototype.grow = function() {
    this.height += 12
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick)
}

Elephant.prototype.play = function() {
    index = Math.floor(Math.random() * this.tricks.length)
    console.log(`${this.name} is ${this.tricks[index]}!`)
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "trotting", "stealing peanuts"]);

ellie.trumpet()
console.log(`Right now, ${ellie.name} is ${ellie.height} inches tall.`)
ellie.grow()
console.log(`${ellie.name} grew, and is now ${ellie.height} inches tall!`)
ellie.addTrick('jumping')
ellie.play()

console.log('---')

// Phase III - Function Invokation

let mikey = new Elephant("Mikey", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, mikey, charlie, kate, micah];

Elephant.prototype.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`)
}

console.log('THE PARADE BEGINS:')

herd.forEach(elephant => elephant.paradeHelper(elephant))

console.log('---')

// Phase IV - Closures

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs, please."
    console.log(order)

    return function(food) {
        order = `${order.slice(0, order.length - 9)} and ${food}, please.`
        console.log(order)
    };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");