pragma solidity 0.4.25;

contract Election {
    // Model a Revie
    struct Candidate {
        uint id; //receipt id
        string name; //revie
        uint voteCount; //stars
    }
    struct Rev {
        string name; //this da revie
        uint stars; // this is the rating
    
    }

    constructor () public {
        addMap(1, "bro no", 2);
        addMap(2, "YOo", 3);
    }

    //I want to map the receipt id to the revie and stars
    // Store accounts that have voted. WE DO NOT NEED TO STORE VOTES.
    mapping(uint => Rev) public reviewer;

    function addMap(uint _id, string _revi, uint _stars) private {
        reviewer[_id] = Rev(_revi, _stars);
    }

}
