pragma solidity >=0.4.21 <0.7.0;

//Proof of Existence contract, version 1
contract ProofOfExistence1 {
    //state
    bytes32 public proof;

    //calculate and store the proof for a document
    //*transactional function*
    function notarize(bytes memory document) public {
        proof = proofFor(document);
    }

    //helper function to get a document's sha256
    //*read-only function*
    function proofFor(bytes memory document) public pure returns (bytes32) {
        return sha256(document);
    }
}