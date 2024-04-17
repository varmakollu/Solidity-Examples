// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
 
contract MyCollection is ERC1155, Ownable {
   constructor() ERC1155("") {}
 
   function setURI(string memory newuri) public onlyOwner {
       _setURI(newuri);
   }
 
   function mint(uint256 id, uint256 amount, bytes memory data)
       public
   {
       _mint(msg.sender, id, amount, data);
   }
}
