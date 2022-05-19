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
library fx{
    uint256 weidig = 1 * 10 ** 18;
    uint256 findig = 1 * 10 ** 14;
    uint256 shqdig = 1 * 10 ** 8;
    uint256 public mlqMax = 3000000*weidig;
    uint256 public lyxMax = 300000000*weidig;
    uint256 public vyzMax = 30000000000*weidig;
    uint256 public mlqRate; // is to be updated 
    uint256 public initMlqRate = 100; // 1 ETH == (initMlqRate) MLQ
    uint256 public lyxRate = 10000; // 1 ETH == (lyxRate) LYX
    uint256 public vyzRate = 1000000; // 1 ETH == (vyzRate) VYZ
}
contract TokenomicSets{
    using fx for *;
    IERC20 internal iUSDC;
    IERC20 internal iWETH;
    IERC20 internal iMLQ;
    IERC20 internal iLYX;
    IERC20 internal iVYZ;
    IERC20 internal mSHK;
    IERC20 internal vSHK;
    IERC20 internal lSHK;
    IERC20 internal xSHK;
    IERC20 internal rSHK;
    
    uint256 public mlqLive;
    uint256 public lyxLive;
    uint256 public vyzLive;
    uint256 public mlqLocked
    uint256 public lyxLocked
    uint256 public vyzLocked
    uint256 public mlqRate;
    uint256 public lyxRate;
    uint256 public vyzRate;
    uint256 public roy;
    
    function setTokenContract(address _contractAddress, uint256 _curr) external returns(bool){ // curr == 0-usdc, 1-weth, 2-mlq, 3-lyx, 4-vyz, 5-mshk, 6-lshk, 7-vshk, 8-xshk, 9-rshk
        if(_curr == 0) USDC = IERC20(_contractAddress);
        if(_curr == 1) WETH = IERC20(_contractAddress);
        if(_curr == 2) MLQ = IERC20(_contractAddress);
        if(_curr == 3) LYX = IERC20(_contractAddress);
        if(_curr == 4) VYZ = IERC20(_contractAddress);
        if(_curr == 5) M_SHQ = IERC20(_contractAddress);
        if(_curr == 6) L_SHQ = IERC20(_contractAddress);
        if(_curr == 7) V_SHQ = IERC20(_contractAddress);
        if(_curr == 8) X_SHQ = IERC20(_contractAddress); 
        if(_curr == 9) R_SHQ = IERC20(_contractAddress);
        return true;
    }
    function setMlqRate(uint256 _newRate) internal pure returns(bool){
        fx.mlqRate = _newRate;
        return (fx.mlqRate == _newRate);
    }

}
contract Init is TokenomicSets {
    address public author;
    address public avax;
    mapping(address => uint256) internal role;
    mapping(address => bytes) internal uData;
    
   
    mapping(address => bool) internal isUser;
    mapping(address => bool) internal blacklist;
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
    constructor(address _auth, address _avx) {
        author = _auth;
        avax = _avx;
        isUser[author] = true;
        role[author] = 99;
        uData[author] = bytes('{"username": "stereo","usermail": "type.stereo@pm.me","usertel": "00491631107542","usertwt": "@stereoIII6","userstatus": "its all reel" ,"useravt":  "https://www.w3schools.com/w3images/avatar2.png","role": "99"}');
        isUser[avax] = true;
        role[avax] = 99;
        uData[avax] = bytes('{"username": "stereo","usermail": "type.stereo@pm.me","usertel": "00491631107542","usertwt": "@stereoIII6","userstatus": "its all reel" ,"useravt":  "https://www.w3schools.com/w3images/avatar2.png","role": "99"}');
        
    
    }
    function getRole(address _adr) external view returns(uint256){
        return role[_adr];
    }
    function isUserBool(address _adr) external view returns(bool){
        return isUser[_adr];
    }
    function editU(address _to, uint256 _role, string memory _data, bool _legit) external isAdmin() returns(bool){
        isUser[_to] = _legit;
        if(_legit == false) blacklist[_to] = true;
        role[_to] = _role;
        uData[_to] = bytes(_data);
        return isUser[_to];
    }
    function blackList(address _to) external isAdmin() returns(bool){
        blacklist[_to] = true;
        return true;
    }
    function editMe(string memory _data) external returns(bool){
        role[msg.sender] = role[msg.sender];
        uData[msg.sender] = bytes(_data);
        return true;
    }
    function makeU(string memory _data) external returns(bool){
        require(isUser[msg.sender] == false, "not a user");
        require(blacklist[msg.sender] == false, "blacklisted");
        isUser[msg.sender] = true;
        role[msg.sender] = 1;
        uData[msg.sender] = bytes(_data);
        return true;
    }
    function showU() external view returns(string memory, uint256){
        return(string(uData[msg.sender]),role[msg.sender]);
    }
    function showAny(address _to) external view returns(string memory, uint256){
        return(string(uData[_to]),role[_to]);
    }
    function withdrawToken(address _contract) external isAdmin() returns(bool){
        Token20 = IERC20(_contract);  
        Token20.transfer(msg.sender,Token20.balanceOf(address(this)));
        return true;
    }
    
    function divide(uint256 _a, uint256 _b) internal pure returns(uint256 res){
        uint256 rem = _a % _b;
        res = (_a - rem) / _b;
    }
    fallback() external{

    }
}