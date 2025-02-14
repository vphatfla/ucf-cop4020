// longest collatz squence
const memo = new Array(1000001).fill(0)
memo[1] = 1 

const calculateCollatzLength = (n) => {
    if (n < memo.length && memo[n] != 0) return memo[n]
   
    let res = 0
    if (n % 2 === 0) res =  1 + calculateCollatzLength(n/2)
    else res =  1 + calculateCollatzLength(3*n+1)

    if (n < memo.length)  memo[n] = res

    return res
}

let max = 0
let maxNu = 1
for (let i = 1; i <= 1000000; i+=1) {
    if (max < calculateCollatzLength(i)) {
        maxNu = i
        max = Math.max(calculateCollatzLength(i), max)
    }
}

console.log('Number with longest chain is ', maxNu, ' with length ', max)

// factorial

const sumDigitFactorial = (n) => {
    let s = 1n;

    for (let i = 2n; i<= n; i++) {
        s *= i
    }
    
    const digits = s.toString()

    let sum = 0n;

    for (let d of digits) {
        sum += BigInt(d)
    }

    return sum 
}

console.log('Sum of digit in 100! is ', sumDigitFactorial(100).toString())
