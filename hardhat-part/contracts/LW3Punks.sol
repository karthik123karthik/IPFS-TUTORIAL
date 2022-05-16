//SPDX-License-Identifier:MIT

// contract address :0x6885695aced4cd2362a1d8EA206aeEfa9Ad98E6A;


pragma solidity ^0.8.0;
 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";
 import "@openzeppelin/contracts/utils/Strings.sol";

contract LW3Punks is  ERC721Enumerable, Ownable {
 //initialize library
 using Strings for uint;
 // maximum there can be only 10 nfts
 uint256 public _maxLW3NFTs = 10;
 //count of current tokens-NFTS and also the Id of the tokens
 uint256 public  currentTokensId;
 //state variable to add the baseURI
 string public  _baseTokenURI;
 //price of token
 uint public  _price = 0.01 ether;
 // to pause the contract in some critical condition
 bool public  pause=false;

 constructor(string memory  _baseURI)ERC721("LW3Punks","LW3P"){
     _baseTokenURI = _baseURI;
 } 

 modifier onlyNoPause{
     require(pause==false,"contract is paused");
     _;
 }

 //mint a nft function
 function mint()public onlyNoPause payable{
   require(msg.value>=_price,"insufficient amount");
   require(currentTokensId<_maxLW3NFTs,"maximum nfts were minted");
   currentTokensId+=1;
   _safeMint(msg.sender,currentTokensId);
 }

 function toPause()public{
//sets the pause to true;
     pause = true;
 }

 function tokenURI(uint tokenId)public view virtual override returns(string memory){
      require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        string memory baseURI = _baseTokenURI;
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(),".json")) : "";    

 }

 // function to withdraw funds

 function withdraw()public onlyOwner{
     address owner = owner();
     uint amount = address(this).balance;
     (bool sent,) = owner.call{value:amount}("");
     require(sent,"transaction failed");
 }
 
 receive() external payable{}
 fallback()external payable{}     

}