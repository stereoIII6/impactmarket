// SPDX-License-Identifier: GPL-3.0
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//   
//              .d8888.  .d88b.  db    db d888888b d88888b d888888b db    db 
//              88'  YP .8P  88. `8b  d8'   `88'   88'     `~~88~~' `8b  d8' 
//              `8bo.   88  d'88  `8bd8'     88    88ooooo    88     `8bd8'  
//                `Y8b. 88 d' 88  .dPYb.     88    88~~~~~    88       88    
//              db   8D `88  d8' .8P  Y8.   .88.   88.        88       88    
//              `8888Y'  `Y88P'  YP    YP Y888888P Y88888P    YP       YP 
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//      @dev            ::              stereoIII6.dao                                                                                                                                          //
//      @msg            ::              type.stereo@pm.me                                                                                                                                    //
//      @github         ::              @stereoIII6 
//      @twitter        ::              @stereoIII6                                                                                                                                              //
//                                                                                                                                                                                      //
//      @dev            ::              willdera.eth                                                                                                                                          //
//      @msg            ::                                                                                                                                                  //
//      @github         ::              @willdera                                                                                                                                              //
//                                                                                                                                                                                      //
//      @author         ::              stereoIII6.dao                                                                                                                                          //
//      msg             ::              type.stereo@pm.me                                                                                                                                    //
//      @github         ::              @stereoIII6 
//      @twitter        ::              @stereoIII6                                                                                                                                             //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @title          ::              Affily8                                                                                                                                     //
//      @description    ::              decentral affiliate system                                                                                                            //
//      @version        ::              0.0.1                                                                                                                                       //
//      @purpose        ::              Refer friennds on the blockchain                                                                                                            //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //


pragma solidity ^0.8.0;
// Open Zeppelin Imports
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

// import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

// Chainlink Imports
// import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
// import "./Nft_Project.sol";

contract Init{
    address public author = 0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242;
    address public avax = 0xa60bD1147c32ACDF9060baDBaa0f62f6Bfd19437;
    mapping(address => uint256) public role;
    mapping(address => bytes) public uData;
    uint256 public maxSupply;
    uint256 public availSupply;
    uint256 rate;
    uint256 percent;
    uint256 digits = 1 * 10 ** 18;
    IERC20 internal Token20;
    IERC721 internal Token721;
    IERC1155 internal Token1155;
    IERC20 internal MLQ;
    mapping(address => bool) public isUser;
    event Log(uint256 indexed id, address sender, address home, uint256 num, bytes message, uint256 stamp);
    event Wait(uint256 indexed id, address sender, address home, uint256 num, bytes message, uint256 stamp);
    uint256 logs;
    modifier isAdmin() {
        require(role[msg.sender] == 99, "you're not admin");
        _;
    }
    modifier isOwner() {
        require(author == msg.sender || avax == msg.sender, "you're not owner");
        _;
    }
    function getRole() external view returns(uint256){
        return role[msg.sender];
    }
    function isUserBool() external view returns(bool){
        return isUser[msg.sender];
    }
    function changeRole(address _to, uint256 _role) external isAdmin() returns(bool){
        role[_to] = _role;
        return true;
    }
    function makeU(string memory _data) external returns(bool){
        isUser[msg.sender] = true;
        role[msg.sender] = 1;
        uData[msg.sender] = bytes(_data);
        return true;
    }
    function showU() external view returns(string memory, uint256){
        return(string(uData[msg.sender]),role[msg.sender]);
    }
    function withdrawToken(address _contract) external isAdmin() returns(bool){
        Token20 = IERC20(_contract);  
        Token20.transfer(msg.sender,Token20.balanceOf(address(this)));
        return true;
    }
    function setMLQ(address _mlq) external returns(bool){
        MLQ = IERC20(_mlq);
        return true;
    }
    function divide(uint256 _a, uint256 _b) internal pure returns(uint256 res){
        uint256 rem = _a % _b;
        res = (_a - rem) / _b;
    }
    fallback() external{

    }
}