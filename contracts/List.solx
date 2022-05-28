// SPDX-License-Identifier: GPL-3.0
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//   
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @artist ::          stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//      @dev ::             stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//      @author ::          stereoIII6.eth                                                                                                                                          //
//      @msg ::             stereoIII6.eth.chat                                                                                                                                     //
//      @github ::          stereoIII6                                                                                                                                              //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @title ::                                                                                                                                                                   //
//      @description ::                                                                                                                                                             //
//      @version ::         0.0.1                                                                                                                                                   //
//      @purpose ::                                                                                                                                                                 //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //

pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract List is ERC721 {
    struct User {
        uint256 id;
        address userAdr;
        string name;
        string email;
        string data;
    }
    uint256 internal u;
    uint256 internal d;
    uint256 public t;
    uint256 internal n;
    
    User[] internal users;
    mapping(address => uint256) internal uNum;
    address payable internal safe;
    address payable internal owner;
    mapping(uint256 => uint256) public userlist; 
    mapping(uint256 => uint256) public donations;
    mapping(uint256 => uint256) public nftletter;
    mapping(uint256 => bytes) public tokens;
    constructor() ERC721("Impact Market","IMPCT") {
        safe = payable(address(this));
        owner = payable(msg.sender);
        u = 1;
    }
    function makeUser(string memory _name,string memory _email, string memory _data) external returns(bool){
        
        bool check = true;
        users.push(User(u,msg.sender,_name,_email,_data));
        uNum[msg.sender] = u;
        userlist[u] = t;
        u += 1;
        _safeMint(msg.sender,t,bytes(_data));
        tokens[t] = bytes(_data);
        t += 1;
        return check;
    }
    function readUser() external view returns(User memory){
        return users[uNum[msg.sender]-1];
    }
    function readToken(uint256 _id) external view returns(string memory){
        return string(tokens[_id]);
    }
    function donate() external payable returns(bool){
        
        require(msg.value >= 1*10**15, "not enough wei");
        _safeMint(msg.sender,t,bytes("i donated"));
        tokens[t] = bytes("i donated");
        donations[d] = t;
        d += 1;
        t += 1;
        return true;
    }
    function nftLetter(address _a, string memory _data) external returns(bool){
        _safeMint(_a,t,bytes(_data));
        tokens[t] = bytes(_data);
        nftletter[n] = t;
        n += 1;
        t += 1;
        return true;
    }

    fallback() external 
    {

    }
}