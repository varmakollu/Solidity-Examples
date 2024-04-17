// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
 
contract CyberDevil is ERC721 {
   constructor() ERC721("CyberDevil", "CYB") {}
 
   function safeMint(address to, uint256 tokenId) public {
       _safeMint(to, tokenId);
   }
}
