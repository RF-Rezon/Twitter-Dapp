// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Twitter {
    mapping(address => string) public tweets;
    address owner;

    constructor () {
        owner = msg.sender; 
    }

    function createTweet(string memory _tweet) public {
        tweets[msg.sender] = _tweet;
    }

    function getTweet(address _owner) public view returns (string memory) {
        // require(owner == _owner , "The operation only allowed for the owner.");
        // if (owner == _owner){
        //     return tweets[_owner];
        // }else{
        //     return "The operation only allowed for the owner.";
        // }
         return tweets[_owner];
    }
}
