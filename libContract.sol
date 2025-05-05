// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Write a Solidity program to create a library that contains functions to find the maximum and minimum of two
// numbers, calculate the factorial of a number, generate the Fibonacci series, and check whether a number is an
// Armstrong number. Also, write a contract to verify that the library functions work correctly.

import "./mathLib.sol";


contract LibContract{
    using Math for uint256;

    function maxNum(uint256 a, uint256 b)public pure returns (uint256){
        return a.max(b);
    }

        function minNum(uint256 a, uint256 b)public pure returns (uint256){
        return a.min(b);
    }

    function fibo(uint256 num)public pure returns(uint256){
        return num.fibonacci();
    }

    function factorial(uint256 num)public pure returns (uint256){
        return num.factorial();
    }

    function armStrong(uint256 num) public pure returns (bool){
        return num.armstrongNum();
    }


}
