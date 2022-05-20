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
    mapping(address => mapping(address => uint256)) public myConnex;
    mapping(address => mapping(address => bool)) internal connected;
    mapping(address => uint256) internal cxCount;
    Connection[] public connex;
    uint256 internal c = 1;
    event Log(uint256 indexed id, address sender, address home, uint256 num, string message, uint256 stamp);
    uint256 logs;
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
    Content[] public posts;
    uint256 internal p = 1;
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
        uint256 last; // timestamp
        uint256 maxU;

    }
    // user => myconvocount => convocount
    mapping(address => mapping(uint256 => uint256)) internal myConvo;
    // convoid => usercount => user
    mapping(uint256 => mapping(uint256 => address)) public usersByConvo;
    // convoid => contentcount => contentid
    mapping(uint256 => mapping(uint256 => uint256)) public contentByConvo;
    // small adr => big adr => dm count for connected 
    mapping(address => mapping(address => uint256)) public dmConvoCount;
    // user address => convoId
    mapping(address => uint256) public myDMCs;
    mapping(address => mapping(uint256 => uint256)) public allDMCs;
    mapping(address => uint256) public unread;
    // small adr => big adr => dm count => convo id 
    mapping(address => mapping(address => mapping(uint256 => uint256))) public dmConvos;
    mapping(address => uint256) internal myCV;
    Convo[] public convos;
    uint256 internal g = 1;
    mapping(uint256 => uint256) internal convoSafe;

    function follow(address _to) external returns(bool){
        address small = msg.sender;
        address big = _to;
        if(_to == smaller(_to, msg.sender)){
            small = _to;
            big = msg.sender;
        }
        if(connected[small][big] == true){
            uint256 revId = myConnex[_to][msg.sender];
            connex[revId].authorize = 3;
            connex[revId].mode = 2;
            connex.push(Connection(c, msg.sender, _to, 3, 2));
            emit Log(logs,msg.sender,address(this),c,"double connex created",block.timestamp);
        }
        else {
            connected[small][big] = true;
            connex.push(Connection(c, msg.sender, _to, 6, 3));
            emit Log(logs,msg.sender,address(this),c,"connex created",block.timestamp);
        }
        myConnex[msg.sender][_to] = c - 1;
        cxCount[msg.sender]++;
        c++;
        return true;
    }
    function setRelation(address _to, uint256 _auth, uint256 _mode) external returns(bool){
        uint256 revId = myConnex[msg.sender][_to];
            connex[revId].authorize = _auth;
            connex[revId].mode = _mode;
            emit Log(logs,msg.sender,address(this),revId,"connex updated",block.timestamp);
        return true;
    }
    function smaller(address _a, address _b) internal pure returns(address){
        address ret;
        if(_a < _b){ ret = _a; }
        else if(_a > _b){ ret = _b; }
        return ret;
    }
    function createConvo(string memory _desc, uint256 _uMax) internal returns(bool){
        convos.push(Convo(g, bytes(_desc), msg.sender, 0, 0, 1, 0, block.timestamp,_uMax));
        usersByConvo[g][0] = msg.sender;
        myConvo[msg.sender][myCV[msg.sender]] = g;
        myCV[msg.sender]++;
        g++;
        emit Log(logs,msg.sender,address(this),g-1,"convo created",block.timestamp);
        logs++;
        return true;
    }
    function addUserToConvo(address _user, uint256 _gid) internal returns(bool){
        require(convos[_gid].maxU > convos[_gid].uSize, "no space in group");
        require(connex[myConnex[_user][msg.sender]].following == msg.sender,"user doesn't follow you");
        require(connex[myConnex[_user][msg.sender]].authorize <= 4, "you are not authorized");
        Convo memory convo = convos[_gid];
        usersByConvo[_gid][convo.uSize] = _user;
        require(_user != 0x0000000000000000000000000000000000000000, "did not add user to convo");
        convos[_gid].uSize++;
        emit Log(logs,msg.sender,address(this),convo.uSize,"group size updated",block.timestamp);
        return true;
    }
    function addContentToConvo(uint256 _gid, uint256 _lvl, uint256 _cTyp, uint256 _pTyp, uint256 _price, string memory _cnt) internal returns(bool){
        Convo memory convo = convos[_gid];
        if(_pTyp == 1){
            // mint 1 ERC721
        }
        if(_pTyp >= 2){
            // mint x ERC1155
        }
        posts.push(Content(p, msg.sender, _lvl, _cTyp, _pTyp, _price, bytes(_cnt), 0, 0));
        myContent[msg.sender][myCC[msg.sender]] = p;
        contentByConvo[_gid][convo.cSize] = p;
        convos[_gid].last = block.timestamp;
        convos[_gid].cSize++;
        myCC[msg.sender]++;
        p++;
        emit Log(logs,msg.sender,address(this),convo.cSize,"content count updated",block.timestamp);
        return true;
    }
    function showContent(uint256 _pid) internal returns(string memory){
        if(posts[_pid].views == 0) unread[msg.sender]--;
        posts[_pid].views++;
        return string(posts[_pid].content);
    }
    function writeDM(address _to, string memory _msg) external returns(bool){
        // require user knows sender
        require(connex[myConnex[_to][msg.sender]].following == msg.sender, "the reciever doesnt know you !");
        // check if valid convo exists 
        address small = msg.sender;
        address big = _to;
        if(_to == smaller(_to, msg.sender)){
            small = _to;
            big = msg.sender;
        }
        uint256 dmc = dmConvoCount[small][big];
        if(dmc == 0) { // first convo
                uint256 convoId = g - 1;
                (bool success) = createConvo("direct message", 2);
                require(success, "did not create convo");
                (success) = addUserToConvo(_to, convoId);
                require(success, "did not add user");
                (success) = addContentToConvo(convoId,3,0,0,0,_msg);
                require(success, "did not add content");
                dmConvos[small][big][dmConvoCount[small][big]] = convoId;
                dmConvoCount[small][big]++;
                allDMCs[msg.sender][myDMCs[msg.sender]] = convoId;
                allDMCs[_to][myDMCs[_to]] = convoId;
                myDMCs[msg.sender]++;
                myDMCs[_to]++;
                unread[_to]++;
                emit Log(logs,msg.sender,address(this),convoId,"new convo msg",block.timestamp);
                return true;
        } 
        else{ // check if last convo is still valid
            uint256 fortyeight = (60*60*48);
            uint256 co = dmConvos[small][big][(dmc-1)];
            if(convos[co].last > (block.timestamp - fortyeight)){ // still valid convo
                addContentToConvo((dmc - 1),3,0,0,0,_msg);
                unread[_to]++;
                emit Log(logs,msg.sender,address(this),co,"existing convo msg",block.timestamp);
                return true; 
            }
            else{ // next convo 
                uint256 convoId = g - 1;
                createConvo("direct message", 2);
                addUserToConvo(_to, convoId);
                addContentToConvo(convoId,2,0,0,0,_msg);
                dmConvos[small][big][dmConvoCount[small][big]] = convoId;
                dmConvoCount[small][big]++;
                myDMCs[msg.sender]++;
                myDMCs[_to]++;
                unread[_to]++;
                emit Log(logs,msg.sender,address(this),convoId,"next convo msg",block.timestamp);
                return true;
            }
        }
        
    } 
    function getLastContent(uint256 _cid,uint _next) external view returns(uint256, uint256, uint256){
        uint256 convoUsers = convos[_cid].uSize;
        uint256 i = 0;
        bool tr = false;
        while(i < convoUsers){
            if(msg.sender == usersByConvo[_cid][i]) tr = true;
            if(msg.sender == convos[_cid].owner) tr = true;
            i++;
        } 
        require(tr == true, "not a member of convo");
        uint256 contentCount = convos[_cid].cSize;
        return (contentByConvo[_cid][contentCount - 1 - (3*_next)]-1,contentByConvo[_cid][contentCount - 2 - (3*_next)]-1,contentByConvo[_cid][contentCount - 3 - (3*_next)]-1);
    }
    
}