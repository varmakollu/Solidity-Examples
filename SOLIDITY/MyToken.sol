//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 
contract MyToken is ERC20 {
   constructor() ERC20("Cookie", "CKE") {
	_mint(msg.sender, 10000 * 10 ** decimals());
   }
 
   function mint(uint _qty) public {
       _mint(msg.sender, _qty);
   }
 
   function burn(uint _qty) public {
       _burn(msg.sender, _qty);
   }
 
}
