// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Varma is ERC721 {
   constructor() ERC721("Varma", "VA") {}


   function safeMint(address to, uint256 tokenId) public {
       _safeMint(to, tokenId);
   }
}
