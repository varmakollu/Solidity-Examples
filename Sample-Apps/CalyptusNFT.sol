// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CalyptusNFT is ERC721, Ownable {

   using Strings for uint256;
   uint public constant MAX_SUPPLY = 10;
   uint public price = 0.01 ether;
   uint public tokenId = 1;
   string _baseUri;

   constructor() ERC721("CalyptusNFT", "CAL") {}
   event NftMinted(address indexed minter, uint indexed tokenId);
   function tokenURI(uint256 _tokenId) public view override returns (string memory) {

       require(_exists(_tokenId), "URI query for nonexistent token");
       string memory baseURI = _baseURI();
       return bytes(baseURI).length != 0 ? string(abi.encodePacked(baseURI, _tokenId.toString(),".json")) : '';

   }

   function _baseURI() internal view override returns (string memory) {
       return _baseUri;
   }

   function mint() public payable {

       require(msg.value >= price, "Ether sent is not sufficient.");
       require(tokenId <= MAX_SUPPLY, "Sold out!");
       _safeMint(msg.sender, tokenId);
       emit NftMinted(msg.sender, tokenId);
       tokenId++;

   }
   function setBaseURI(string memory newBaseURI) external onlyOwner {
       _baseUri = newBaseURI;
   }
   function setPrice(uint newPrice) external onlyOwner {
       price = newPrice;
   }
   function withdraw() external onlyOwner {
       require(payable(msg.sender).send(address(this).balance));
   }
}
