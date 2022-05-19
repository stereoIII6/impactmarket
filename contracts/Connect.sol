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
//      @dev            ::                                                                                                                                                     //
//      @msg            ::                                                                                                                                                  //
//      @github         ::                                                                                                                                                           //
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
contract Connect {

    struct Connection{
        uint256 xid;
        address follower; 
        address following;
        uint256 authorize; // 0-private , 1-close, 2-fam, 3-friends, 4-work, 5-friendsof, 6-public
        uint256 mode; // 0-all, 1-pri, 2-mod, 3-sub, 4-mute, 5-block, 99-ban
    }
    mapping(address => mapping(address => uint256)) internal myConnex;
    mapping(address => mapping(address => bool)) internal connected;
    mapping(address => uint256) internal cxCount;
    Connection[] internal connex;
    uint256 internal c;

    struct Content{
        uint256 cid;
        address owner;
        uint256 authLevel; // 0-private , 1-closed, 2-fam, 3-friends, 4-work, 5-friendsof, 6-connected, 7-public, 99-multi
        uint256 contentType; // 0-msg, 1-post, 2-clip, 3-poll, 4-nft, 5-dias
        uint256 publishType; // 0-onchain, 1-ERC721 single, XX-ERC1155 poster
        uint256 viewPrice;
        bytes content;
        uint256 likes;
        uint256 views;
    }
    // user => mypostcount => postcount 
    mapping(address => mapping(uint256 => uint256)) internal myContent;
    // user => mypostcount 
    mapping(address => uint256) internal myCC;
    Content[] internal posts;
    uint256 internal p;
    // postcount => currency => amount // curr // 0-mlq, 1-lyx, 2-vyz
    mapping(uint256 => mapping(uint256 => uint256)) internal contentSafe;

    struct Convo{
        uint256 gid;
        bytes desc;
        address owner;
        uint256 likes;
        uint256 views;
        uint256 uSize;
        uint256 cSize;
    }
    // user => myconvocount => convocount
    mapping(address => mapping(uint256 => uint256)) internal myConvo;
    // convoid => usercount => user
    mapping(uint256 => mapping(uint256 => address)) internal usersByConvo;
    // convoid => contentcount => contentid
    mapping(uint256 => mapping(uint256 => uint256)) internal contentByConvo;
    mapping(address => uint256) internal myCV;
    Convo[] internal convos;
    uint256 internal g;
    mapping(uint256 => uint256) internal convoSafe;

    function follow(address _to, uint256 _authLvl, uint256 _mode) external returns(bool){
        address small = msg.sender;
        address big = _to;
        if(_to == smaller(_to, msg.sender)){
            small = _to;
            big = msg.sender;
        }
        connected[small][big] = true;
        connex.push(Connection(c, msg.sender, _to, _authLvl,_mode));
        myConnex[msg.sender][_to] = c;
        cxCount[msg.sender]++;
        c++;
        return true;
    }
    function smaller(address _a, address _b) internal pure returns(address){
        address ret;
        if(_a < _b){ ret = _a; }
        else if(_a > _b){ ret = _b; }
        return ret;
    }

    function createConvo(string memory _desc) external returns(bool){
        convos.push(Convo(g, bytes(_desc), msg.sender, 0, 0, 1, 0));
        usersByConvo[g][0] = msg.sender;
        myConvo[msg.sender][myCV[msg.sender]] = g;
        myCV[msg.sender]++;
        g++;
        return true;
    }
    function addUserToConvo(address _user, uint256 _gid) external returns(bool){
        require(connex[myConnex[_user][msg.sender]].following == msg.sender);
        require(connex[myConnex[_user][msg.sender]].authorize <= 4);
        Convo memory convo = convos[_gid];
        usersByConvo[_gid][convo.uSize] = _user;
        convo.uSize++;
        return true;
    }
    function addContentToConvo(uint256 _gid, uint256 _lvl, uint256 _cTyp, uint256 _pTyp, uint256 _price, string memory _cnt) external returns(bool){
        Convo memory convo = convos[_gid];
        contentByConvo[_gid][convo.cSize] = p;
        if(_pTyp == 1){
            // mint 1 ERC721
        }
        if(_pTyp >= 2){
            // mint x ERC1155
        }
        posts.push(Content(p, msg.sender, _lvl, _cTyp, _pTyp, _price, bytes(_cnt), 0, 0));
        myContent[msg.sender][myCC[msg.sender]] = p;
        myCC[msg.sender]++;
        p++;
        return true;
    }

    function showContent(uint256 _pid) external view returns(string memory){
           return string(posts[_pid].content);
    }

}