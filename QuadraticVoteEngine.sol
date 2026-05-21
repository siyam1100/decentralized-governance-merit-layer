// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Reputation.sol";

contract QuadraticVoteEngine {
    Reputation public reputation;

    constructor(address _rep) {
        reputation = Reputation(_rep);
    }

    /**
     * @dev Calculates voting power based on Quadratic formula:
     * Effective Power = sqrt(Tokens) * ReputationMultiplier
     */
    function calculatePower(uint256 tokenBalance, address voter) public view returns (uint256) {
        uint256 basePower = sqrt(tokenBalance);
        uint256 multiplier = reputation.getWeight(voter);
        
        return multiplier > 0 ? basePower * multiplier : basePower;
    }

    function sqrt(uint256 x) internal pure returns (uint256 y) {
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}
