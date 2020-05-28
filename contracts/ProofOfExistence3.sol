pragma solidity >= 0.5.0 < 0.7.0;

contract ProofOfExistence3 {
  //state
    mapping(bytes32 => bool) private proofs;

    function storeProof(bytes32 proof) internal {
        proofs[proof] = true;
    }

    //calculate and store the proof for a document
    //*transactional function*
    function notarize(string calldata document) external {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    //helper function to get a document's sha256
    //*read-only function*
    function proofFor(string memory document) public pure returns (bytes32) {
        return keccak256(bytes(document));
    }

    function checkDocument(string memory document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) internal view returns (bool) {
        return proofs[proof];
    }
}
