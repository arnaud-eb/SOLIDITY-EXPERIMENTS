pragma solidity ^0.5.0;

//Proof of Existence contract, version 2
contract ProofOfExistence2 {
    //state
    mapping(bytes32 => bool) proofs;

    function storeProof(bytes32 proof) public {
        proofs[proof] = true;
    }

    //calculate and store the proof for a document
    //*transactional function*
    function notarize(bytes memory document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    //helper function to get a document's sha256
    //*read-only function*
    function proofFor(bytes memory document) public pure returns (bytes32) {
        return sha256(document);
    }

    function checkDocument(bytes memory document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) public view returns (bool) {
        return proofs[proof];
    }
}