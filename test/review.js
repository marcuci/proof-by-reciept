var Class = artifacts.require("./Class.sol");

contract("Class", function(accounts) {
  var ClassInstance;

  it("initializes with two reviews", function() {
    return Class.deployed().then(function(instance) {
      return instance.reviewCount();
    }).then(function(count) {
      assert.equal(count, 2);
    });
  });

  it("it initializes the reviews with the correct values", function() {
    return Class.deployed().then(function(instance) {
      ClassInstance = instance;
      return ClassInstance.reviews(1);
    }).then(function(review) {
      assert.equal(review[0], 1, "contains the correct recepitID");
      assert.equal(review[1], "bro no", "contains the correct orderNumber");
      assert.equal(review[2], 2, "contains the correct productName");
      return ClassInstance.reviews(2);
    }).then(function(review) {
      assert.equal(review[0], 2, "contains the correct recepitID");
      assert.equal(review[1], "YOo", "contains the correct orderNumber");
      assert.equal(review[2], 3, "contains the correct productName");
    });
  });
});

//        addMap(1, "bro no", 2);
//addMap(2, "YOo", 3);