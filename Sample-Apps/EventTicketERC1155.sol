// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EventTicket is ERC1155, Ownable {
    
    // Ticket data structure
    struct Ticket {
        uint256 price;
        uint256 maxPerBatch;
        uint256 totalMinted;
    }
    
    // Mapping of ticket ID to ticket details
    mapping(uint256 => Ticket) public tickets;
    
    // USDC contract address
    address public usdcAddress;
    
    // Events
    event TicketMinted(uint256 indexed id, uint256 amount, uint256 price, uint256 maxPerBatch);
    event MaxPerBatchUpdated(uint256 indexed id, uint256 maxPerBatch);
    
    constructor(address _usdcAddress) ERC1155("https://example.com/tickets/{id}.json") {
        usdcAddress = _usdcAddress;
    }
    
    // Mint new tickets
    function mint(uint256 id, uint256 amount) external onlyOwner {
        require(tickets[id].totalMinted + amount <= tickets[id].maxPerBatch, "Exceeded maximum per batch");
        tickets[id].totalMinted += amount;
        _mint(msg.sender, id, amount, "");
        emit TicketMinted(id, amount, tickets[id].price, tickets[id].maxPerBatch);
    }
    
    // Update maximum tickets per batch
    function updateMaxPerBatch(uint256 id, uint256 maxPerBatch) external onlyOwner {
        require(maxPerBatch >= tickets[id].totalMinted, "New max limit must be greater than or equal to tickets already minted");
        tickets[id].maxPerBatch = maxPerBatch;
        emit MaxPerBatchUpdated(id, maxPerBatch);
    }
    
    // Buy tickets with USDC
    function buy(uint256 id, uint256 amount) external {
        require(tickets[id].totalMinted + amount <= tickets[id].maxPerBatch, "Exceeded maximum per batch");
        uint256 totalCost = amount * tickets[id].price;
        IERC20(usdcAddress).transferFrom(msg.sender, address(this), totalCost);
        tickets[id].totalMinted += amount;
        _mint(msg.sender, id, amount, "");
        emit TicketMinted(id, amount, tickets[id].price, tickets[id].maxPerBatch);
    }
    
    // Set ticket details
    function setTicketDetails(uint256 id, uint256 price, uint256 maxPerBatch) external onlyOwner {
        tickets[id].price = price;
        tickets[id].maxPerBatch = maxPerBatch;
    }
}