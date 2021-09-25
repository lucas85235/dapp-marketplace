const BEP20 = artifacts.require("BEP20");
const SimpleCollectible = artifacts.require("SimpleCollectible");

module.exports = function(deployer) {
    deployer.deploy(BEP20, 100);
    deployer.deploy(SimpleCollectible);
};