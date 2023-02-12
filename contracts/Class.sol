pragma solidity ^0.4.25;

contract Class {
    // Model a dat object 
    struct dat {
        uint recepitID;
        string reviewMessage;
        uint numStars;
    }

    // Get and set reviews
    mapping(uint => dat) public reviews;

    // Get the list of order numbers
    mapping(uint => bool) public hm_orderNumber_bool;

    // Counter for the number of reviews
    uint public reviewCount;

    constructor () public {
        addReview(1, "Chicken and rice", 4 );
        addReview(2, "Thai Basil Curry", 5 );
    }

    function addReview (uint _product_id, string _review_message, uint _num_stars) private {
        require(!hm_orderNumber_bool[_product_id]); // verify uniqueness of orderNumber
        require(_num_stars >= 1 && _num_stars <= 5); // verify if the rating range is valid
        reviewCount ++;
        reviews[reviewCount] = dat(_product_id, _review_message, _num_stars);
        hm_orderNumber_bool[reviewCount] = true;
    }
}