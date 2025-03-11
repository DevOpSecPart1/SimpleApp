const chai = require("chai");
const expect = chai.expect;

describe("Sample Test Suite", function () {
  it("should pass a basic true check", function () {
    expect(true).to.be.true;
  });

  it("should correctly add numbers", function () {
    expect(2 + 3).to.equal(5);
  });

  it("should correctly check a string", function () {
    expect("DevOps").to.equal("DevOps");
  });
});
