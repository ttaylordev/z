#!/usr/bin/env node

const str = process.argv[2]

function palindrome(str){
  return str == str.split('').reverse().join('')
}

console.log(`is ${str} a palindrome? that's ${palindrome(str)}`)

