var ProofOfExistence2 = artifacts.require("ProofOfExistence2");
var ProofOfExistence3 = artifacts.require("ProofOfExistence3");

module.exports = function(deployer) {
    deployer.deploy(ProofOfExistence2);
    deployer.deploy(ProofOfExistence3);
}