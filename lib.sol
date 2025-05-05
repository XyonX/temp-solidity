// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math{

    function max(uint a , uint b)public pure returns(uint){
        return a>b?a:b;
    }
    function min(uint a, uint b)public pure returns (uint){
        return a<b?a:b;
    }
    function factorial(uint256 n)public pure returns(uint256){
       require(n <= 77, "Input too large");
        if(n==0 || n==1){
            return 1;
        }
         uint256 res=1;
        for(uint256 i=2;i<=n;i++){
            res*=i;
        }
        return res;
    }
    function fibonacci(uint256 n)public pure returns(uint256){
       
       require(n <= 100, "Input too large for Fibonacci");
        if(n==0)return 0;
        if (n == 1) return 1;
        uint256 current = 1;
        
        uint256 prev = 0;
        for(uint256 i=2;i<=n;i++){
            uint256 next =prev+current;
            prev=current;
            current=next;
        }
        return current;
    }

    function armstrongNum(uint256 n)public pure returns(bool){
        if(n==0) return false;
        uint256 digit=0;
        uint256 rem=n;
        while(rem!=0){
            digit++;
            rem=rem/10;
        }

        uint256 sum=0;
        rem = n;
        while(rem !=0){
            uint256  current = rem%10;
            sum+=pow(current,digit);
            rem /=10;
        }
        return sum==n;

    }

    function pow(uint256 n,uint256 m)public pure returns(uint256){
        if(m==0)return 1;
        if(n==0)return 0;
        uint256 res=1;
        for(uint256 i=0;i<m;i++){
            res*=n;
        }
        return res;
    }

}
