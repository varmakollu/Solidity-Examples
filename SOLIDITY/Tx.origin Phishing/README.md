# tx.origin

- tx.origin global variable returns the account’s address that initiates a transaction. For a transaction to initiate on the ethereum blockchain, it has to have an external caller account. Such accounts which are not a smart contract on the blockchain itself are called Externally Owned Accounts(EOA). 

- The account associated with your wallet, for instance, is an EOA. Here’s Vitalik Buterin’s EOA for your reference: [0xd8da6bf26964af9d7eed9e03e53415d37aa96045](https://etherscan.io/address/0xd8da6bf26964af9d7eed9e03e53415d37aa96045). 

## Vulnerability With tx.origin

- The idea behind tx.origin is to indicate who originated the transaction. However, as we will soon see this can be misleading and opens contracts up to the possibility of being exploited if used without caution.

- Here is a snippet of the smart contract that can steal funds from the wallet if the owner interacts with it:

```
// To steal the funds:
 
   // Make the Owner of Wallet call this function:
   function attack() public {
       // Transfer Wallet's funds to the hacker
       wallet.transfer(hacker, address(wallet).balance);
   }
 
   // Or make the owner send some Eth to this contract's address
   // which will trigger fallback() like this:
   fallback() payable {
       // Transfer Wallet's funds to the hacker
       wallet.transfer(hacker, address(wallet).balance);
   }
```

## Prevention
- Contrary to tx.origin, msg.sender is a global variable that points to the immediate address that sent the transaction rather than the EOA that initiated it. The easiest way to prevent this from occurring is to use msg.sender instead of tx.origin in authentication applications. 
