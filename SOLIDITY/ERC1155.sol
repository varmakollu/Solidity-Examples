/* Implement a transfer function to transfer ownership of an in-game asset in your Smart Contract */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameAssets is ERC1155("https://game.com/api/item/{id}.json"), Ownable(msg.sender) {
    constructor() {
        // Mint some initial tokens for testing
        _mint(msg.sender, 1, 100, "");
        _mint(msg.sender, 2, 200, "");
    }

    function transferAsset(address from, address to, uint256 id, uint256 amount) external {
        require(from == msg.sender || isApprovedForAll(from, msg.sender), "Not approved to transfer");
        require(balanceOf(from, id) >= amount, "Insufficient balance");

        safeTransferFrom(from, to, id, amount, "");
    }

    // Only owner can mint new assets
    function mint(address account, uint256 id, uint256 amount) external onlyOwner {
        _mint(account, id, amount, "");
    }

}
