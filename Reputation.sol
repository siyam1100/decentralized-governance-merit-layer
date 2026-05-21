// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Reputation is Ownable {
    mapping(address => uint256) private _meritScore;

    event MeritAdded(address indexed account, uint256 amount);
    event MeritBurned(address indexed account, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function addMerit(address account, uint256 amount) external onlyOwner {
        _meritScore[account] += amount;
        emit MeritAdded(account, amount);
    }

    function burnMerit(address account, uint256 amount) external onlyOwner {
        require(_meritScore[account] >= amount, "Insufficient merit");
        _meritScore[account] -= amount;
        emit MeritBurned(account, amount);
    }

    function getWeight(address account) external view returns (uint256) {
        // Merit weight is used to calculate voting power multiplier
        return _meritScore[account];
    }
}
