import * as fs from 'fs';
function factorialNum(n: number): number {
    if (n <= 1) return 1;
    return n * factorialNum(n-1);
}

function findMillPerm(list: number[], n: number): string {
    n = n-1;

    let res: number[] = []
    let auxList = [...list]

    while (auxList.length > 0) {
        const size = factorialNum(auxList.length-1);
        const i = Math.floor(n/ size)

        res.push(auxList[i])
        auxList.splice(i, 1)

        n = n % size
    }
    return res.join('')
}

const ar = [0,1,2,3,4,5,6,7,8,9];
console.log('The millionth perm is = ', findMillPerm(ar, 1000000));
// problem 31

function countCom(targetAmount: number): number {
    const coins: number[] = [1, 2, 5, 10, 20, 50, 100, 200];
    const ways: number[] = new Array(targetAmount + 1).fill(0);
    ways[0] = 1;

    for (const c of coins) {
        for (let amount = c; amount <= targetAmount; amount++) {
            ways[amount] += ways[amount - c];
        }
    }

    return ways[targetAmount];
}

const target = 200;
console.log(`Number of ways to make £2: ${countCom(target)}`);

// problem 42
function wValue(word: string): number {
    return word.split('').reduce((sum, char) => 
        sum + (char.charCodeAt(0) - 'A'.charCodeAt(0) + 1), 0);
}

function triaNumber(max: number): Set<number> {
    const triangleNums = new Set<number>();
    let n = 1;
    let triangleNum = (n * (n + 1)) / 2;
    
    while (triangleNum <= max) {
        triangleNums.add(triangleNum);
        n++;
        triangleNum = (n * (n + 1)) / 2;
    }
    return triangleNums;
}

function triaWords(input: string): number {
    const words = input.split(',').map(word => word.replace(/"/g, ''));
    
    const maxWordValue = Math.max(...words.map(wValue));
    
    const triangleNumbers = triaNumber(maxWordValue);
    
    return words.filter(word => triangleNumbers.has(wValue(word))).length;
}


const input = fs.readFileSync('words.txt', 'utf8');
const words = input.split(',').map(word => word.replace(/"/g, ''));
console.log("Number of triangle words:", triaWords(input));
