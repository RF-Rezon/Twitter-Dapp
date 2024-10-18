// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Twitter {

    uint16 public MAX_TWEET_LENGTH = 280;

    address owner;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[] ) public tweets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner (){
        require(msg.sender == owner, "You are not the owner. So you are not allowed to this operation.");
        _;
    }

    function changeTweetLength (uint16 newTweetLength) public onlyOwner returns (uint16) {
       return MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long bro!" );

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet( uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}
