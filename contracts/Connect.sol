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
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//      @dev            ::              Juan Xavier Valverde                                                                                                                                    //
//      @msg            ::              juanxaviervm@hotmail.com                                                                                                                               //
//      @twitter        ::              @JuanXavier                                                                                                                                             //
//      @github         ::              @JuanXavier                                                                                                                                             //
//                                                                                                                                                                                  //                                                                                                                                                                                 //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//      @title          ::              s0xiety Connect                                                                                                                             //
//      @description    ::              decentral s0xiety                                                                                                                           //
//      @version        ::              0.0.1                                                                                                                                       //
//      @purpose        ::              Refer friennds on the blockchain                                                                                                            //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //

pragma solidity ^0.8.7;

// Open Zeppelin Imports
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// constant library fx                                                                                                                                                              //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
library fx {
    uint256 constant weidig = 1 * 10**18;
    uint256 constant findig = 1 * 10**14;
    uint256 constant shqdig = 1 * 10**8;
    uint256 public constant mlqMax = 3000000 * weidig;
    uint256 public constant lyxMax = 300000000 * weidig;
    uint256 public constant vyzMax = 30000000000 * weidig;
    uint256 public constant shqMax = 100 * shqdig;
    uint256 public constant initMlqRate = 100; // 1 ETH == (initMlqRate) MLQ
    uint256 public constant lyxRate = 10000; // 1 ETH == (lyxRate) LYX
    uint256 public constant vyzRate = 1000000; // 1 ETH == (vyzRate) VYZ
    uint256 public constant minRoy = 10;
    uint256 public constant maxRoy = 30;
    uint256 public constant initRoy = 20;
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
library sc {

}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract all {
    using fx for *;
    using sc for *;
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract TokenomicSets is all {
    uint256 public mlqRate; // is to be updated
    IERC20 internal iMLQ;
    IERC20 internal iWETH;
    IERC20 internal iUSDC;
    IERC20 internal iLYX;
    IERC20 internal iVYZ;
    IERC20 internal M_SHQ;
    IERC20 internal L_SHQ;
    IERC20 internal V_SHQ;
    IERC20 internal X_SHQ;
    IERC20 internal R_SHQ;
    IERC20 internal Token20;
    IERC721 internal Token721;

    uint256 public mlqLive;
    uint256 public lyxLive;
    uint256 public vyzLive;
    uint256 public mlqLocked;
    uint256 public lyxLocked;
    uint256 public vyzLocked;

    uint256 public roy;

    function setTokenContract(address _contractAddress, uint256 _curr)
        external
        returns (bool)
    {
        // curr == 0-usdc, 1-weth, 2-mlq, 3-lyx, 4-vyz, 5-mshk, 6-lshk, 7-vshk, 8-xshk, 9-rshk
        if (_curr == 0) iUSDC = IERC20(_contractAddress);
        if (_curr == 1) iWETH = IERC20(_contractAddress);
        if (_curr == 2) iMLQ = IERC20(_contractAddress);
        if (_curr == 3) iLYX = IERC20(_contractAddress);
        if (_curr == 4) iVYZ = IERC20(_contractAddress);
        if (_curr == 5) M_SHQ = IERC20(_contractAddress);
        if (_curr == 6) L_SHQ = IERC20(_contractAddress);
        if (_curr == 7) V_SHQ = IERC20(_contractAddress);
        if (_curr == 8) X_SHQ = IERC20(_contractAddress);
        if (_curr == 9) R_SHQ = IERC20(_contractAddress);
        return true;
    }

    function setMlqRate(uint256 _newRate) internal returns (bool) {
        mlqRate = _newRate;
        return (mlqRate == _newRate);
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Init is TokenomicSets {
    address public author;
    address public avax;
    mapping(address => uint256) public role;
    mapping(address => bytes) public uData;

    mapping(address => bool) internal isUser;
    mapping(address => bool) internal blacklist;
    event Log(
        uint256 indexed id,
        address sender,
        address home,
        uint256 num,
        bytes message,
        uint256 stamp
    );
    event Wait(
        uint256 indexed id,
        address sender,
        address home,
        uint256 num,
        bytes message,
        uint256 stamp
    );
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
        uData[author] = bytes(
            '{"username": "stereo","usermail": "type.stereo@pm.me","usertel": "00491631107542","usertwt": "@stereoIII6","userstatus": "its all reel" ,"useravt":  "https://www.w3schools.com/w3images/avatar2.png","role": "99"}'
        );
        isUser[avax] = true;
        role[avax] = 99;
        uData[avax] = bytes(
            '{"username": "stereo","usermail": "type.stereo@pm.me","usertel": "00491631107542","usertwt": "@stereoIII6","userstatus": "its all reel" ,"useravt":  "https://www.w3schools.com/w3images/avatar2.png","role": "99"}'
        );
        setMlqRate(fx.initMlqRate);
    }

    function getRole(address _adr) external view returns (uint256) {
        return role[_adr];
    }

    function isUserBool(address _adr) external view returns (bool) {
        return isUser[_adr];
    }

    function editU(
        address _to,
        uint256 _role,
        string memory _data,
        bool _legit
    ) external isAdmin returns (bool) {
        isUser[_to] = _legit;
        if (_legit == false) blacklist[_to] = true;
        role[_to] = _role;
        uData[_to] = bytes(_data);
        return isUser[_to];
    }

    function blackList(address _to) external isAdmin returns (bool) {
        blacklist[_to] = true;
        return true;
    }

    function editMe(string memory _data) external returns (bool) {
        role[msg.sender] = role[msg.sender];
        uData[msg.sender] = bytes(_data);
        return true;
    }

    function makeU(string memory _data) external returns (bool) {
        require(isUser[msg.sender] == false, "not a user");
        require(blacklist[msg.sender] == false, "blacklisted");
        isUser[msg.sender] = true;
        role[msg.sender] = 1;
        uData[msg.sender] = bytes(_data);
        return true;
    }

    function showU() external view returns (string memory, uint256) {
        return (string(uData[msg.sender]), role[msg.sender]);
    }

    function showAny(address _to)
        external
        view
        returns (string memory, uint256)
    {
        return (string(uData[_to]), role[_to]);
    }

    function MLQ_Address() external view returns (address) {
        return address(this);
    }

    function withdrawToken(address _contract) external isAdmin returns (bool) {
        Token20 = IERC20(_contract);
        Token20.transfer(msg.sender, Token20.balanceOf(address(this)));
        return true;
    }

    function setRole(uint256 _rl, address _adr) external returns (uint256) {
        return role[_adr] = _rl;
    }

    function setUdata(string memory _data, address _adr)
        external
        returns (bytes memory)
    {
        isUser[_adr] = true;
        return uData[_adr] = bytes(_data);
    }

    function isUdata() external returns (bool) {
        return isUser[msg.sender];
    }

    function setLogs() external {
        logs++;
    }

    function getLogs() external returns (uint256) {
        return logs;
    }

    function divide(uint256 _a, uint256 _b)
        internal
        pure
        returns (uint256 res)
    {
        uint256 rem = _a % _b;
        res = (_a - rem) / _b;
    }

    fallback() external {}
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract InitFace {
    Init public init;

    constructor(address _initAdr) {
        init = Init(_initAdr);
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract MLQ is ERC20, Init {
    uint256 rate;
    uint256 maxSupply;

    constructor(address _auth, address _avax)
        ERC20("Milq Token", "MLQ")
        Init(_auth, _avax)
    {
        require(msg.sender == author);
        role[msg.sender] = 99;
        uData[msg.sender] = bytes(
            '{"username":"@stereoiii6","email":"type.stereo@pm.me"}'
        );
        maxSupply = fx.mlqMax;
        rate = fx.initMlqRate;
        // mint(5000);
    }

    function mint(uint256 _amount) internal isOwner returns (bool) {
        uint256 ts = totalSupply();
        require((_amount * 10**18) <= maxSupply - ts);
        _mint(address(this), rate * _amount * 10**18);
        return true;
    }

    function buy() external payable returns (bool) {
        uint256 ts = totalSupply();
        require((msg.value * rate) <= maxSupply - ts, "supply");
        require(msg.value > 0, "value");

        _mint(msg.sender, msg.value * rate);
        return true;
    }

    function showSafeWallet() external view isAdmin returns (uint256, uint256) {
        return (address(this).balance, balanceOf(address(this)));
    }

    function withdraw(uint256 _eth, uint256 _mlq)
        external
        isAdmin
        returns (bool)
    {
        require(_mlq * 10**18 <= balanceOf(address(this)));
        require(_eth * 10**18 <= address(this).balance);
        transfer(payable(author), _mlq * 10**18);
        payable(author).transfer(_eth * 10**18);
        return true;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Affilly8 is InitFace, TokenomicSets {
    uint256 digits;
    uint256 percent;
    event Log(
        uint256 indexed id,
        address sender,
        address home,
        uint256 num,
        bytes message,
        uint256 stamp
    );

    constructor(
        address _auth,
        address _avax,
        address _initAdr
    ) InitFace(_initAdr) {
        // feed with utility token address
        require(msg.sender == _auth || msg.sender == _avax); // only author can build
        init.setRole(99, msg.sender);
        percent = 2;
        digits = fx.weidig; // make author admin
        init.setUdata(
            '{"username":"@stereoiii6","email":"type.stereo@pm.me"}',
            msg.sender
        ); // set user data                                                                          // set is user true
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("contract created"),
            block.timestamp
        ); // log
        init.setLogs(); // iterate log                                                                                   // grab utility token
    }

    struct Campaign {
        // NFT sale required fields
        uint256 id;
        bytes data;
        address owner;
        address tokenAddress;
        uint256 tokenId;
        uint256 price;
        address payCurrency;
        uint256 fee;
        uint256 duration;
    }

    struct RefLinks {
        // Link Structs
        uint256 id; // id
        uint256 campaigId; // campaing reference id
        address promoter; // fee reciever / promoter
    }
    struct Transactions {
        uint256 id;
        uint256 rlid;
        uint256 cid;
        uint256 txdate;
    }
    Campaign[] public campaigns; // Campaign Mapping
    RefLinks[] public links; // List Mapping
    Transactions[] public txs;
    mapping(address => uint256) internal myCampaignCount; // counts users campaigns
    mapping(address => mapping(uint256 => Campaign)) public showCampaign; // maps users campaigns
    mapping(address => uint256) internal mylinkCount; // counts users links
    mapping(address => mapping(uint256 => RefLinks)) public showLinks; // maps users links
    uint256 c; // count campaigns
    uint256 l; // count links
    uint256 t; // count txs
    modifier isU() {
        // role 1
        require(init.isUdata() == true, "you are not user");
        _;
    }
    modifier isProd() {
        // role 2
        require(
            init.getRole(msg.sender) == 2 ||
                init.getRole(msg.sender) == 4 ||
                init.getRole(msg.sender) == 99,
            "you are not producer"
        );
        _;
    }
    modifier isProm() {
        // role 3
        require(
            init.getRole(msg.sender) == 3 ||
                init.getRole(msg.sender) == 4 ||
                init.getRole(msg.sender) == 99,
            "you are not promoter"
        );
        _;
    }

    // both role 4 // admin role 99
    // become a producer
    function getCampaignCount() external view returns (uint256) {
        return c;
    }

    function getLinkCount() external view returns (uint256) {
        return l;
    }

    function getTxCount() external view returns (uint256) {
        return t;
    }

    function beProducer() external isU returns (bool) {
        require(init.getRole(msg.sender) != 2, "you are producer");
        if (init.getRole(msg.sender) == 1) {
            init.setRole(2, msg.sender);
        } // if user is guest
        if (init.getRole(msg.sender) == 3) {
            init.setRole(4, msg.sender);
        } // is user is promoter
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs();
        return true;
    }

    // become a promoter
    function bePromoter() external isU returns (bool) {
        require(init.getRole(msg.sender) != 3, "you are promoter");
        if (init.getRole(msg.sender) == 1) {
            init.setRole(3, msg.sender);
        } // if user is guest
        if (init.getRole(msg.sender) == 2) {
            init.setRole(4, msg.sender);
        } // if user is producer
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs();
        return true;
    }

    // make a ref link
    function makeLink(uint256 _cid) external isU isProm returns (bool) {
        links.push(RefLinks(l, _cid, msg.sender)); // Push reflink to struct mapping
        mylinkCount[msg.sender]++; // iterate user link count
        showLinks[msg.sender][l] = links[l]; // preserve links in mapping
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs(); // iterate log
        l++; // iterate link
        return true;
    }

    // makes ref links for producers automatically
    function makeOwnLink(uint256 _cid) internal isU returns (bool) {
        links.push(RefLinks(l, _cid, msg.sender)); // Push reflink to struct mapping
        mylinkCount[msg.sender]++; // iterate user link count
        showLinks[msg.sender][l] = links[l]; // preserve links in mapping
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs(); // iterate log
        l++; // iterate link
        return true;
    }

    // make a campaign
    function makeCampaign(
        uint256 _id,
        string memory _data,
        address _owner,
        address _tokenAddress,
        uint256 _tokenId,
        uint256 _price,
        address _payCurrency,
        uint256 _fee,
        uint256 _duration
    ) external payable isU isProd returns (bool) {
        // transfer mlq to campaign safe
        campaigns.push( // push campaign to mapping
            Campaign(
                _id,
                bytes(_data),
                _owner,
                _tokenAddress,
                _tokenId,
                _price * digits,
                _payCurrency,
                _fee * digits,
                _duration * 60 * 60
            )
        );
        myCampaignCount[msg.sender]++; // iterate user campaign count
        showCampaign[msg.sender][c] = campaigns[c]; // preserve user campaign in mapping
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs(); // iterate logs
        makeOwnLink(c); // create ref link for producer                                                                                                  // iterate item mapping
        c++; // iterate campaign mapping
        return true;
    }

    function approveCampaign(uint256 _rlid) external returns (bool) {
        Campaign memory camp = campaigns[links[_rlid].campaigId];
        if (msg.sender == camp.owner) {
            Token721 = IERC721(camp.tokenAddress);
            Token721.approve(address(this), camp.tokenId);
            Token721.setApprovalForAll(address(this), true);
            emit Log(
                init.getLogs(),
                msg.sender,
                address(this),
                999,
                bytes("became producer"),
                block.timestamp
            );
            init.setLogs();
        } else if (msg.sender != links[_rlid].promoter) {
            Token20 = IERC20(camp.payCurrency);
            Token20.approve(address(this), camp.price);
            emit Log(
                init.getLogs(),
                msg.sender,
                address(this),
                999,
                bytes("became producer"),
                block.timestamp
            );
            init.setLogs();
        }

        return true;
    }

    // finalize a tx
    function finalize(uint256 _rlid) external payable returns (bool) {
        uint256 cid = links[_rlid].campaigId; // grab campaign id
        address prom = links[_rlid].promoter;
        Campaign memory camp = campaigns[cid]; // grab link promoter
        uint256 cfee = ((100 / camp.price) * percent); // grab pay value (price - fee)
        uint256 pay = ((100 / camp.price) * (100 - percent)) - camp.fee;
        Token721 = IERC721(camp.tokenAddress);
        if (camp.payCurrency != 0x0000000000000000000000000000000000000000) {
            Token20 = IERC20(camp.payCurrency);
            require(Token20.balanceOf(msg.sender) >= camp.price);
            Token20.transferFrom(msg.sender, camp.owner, pay); // pay the nft
            Token721.transferFrom(camp.owner, msg.sender, camp.tokenId); // send the nft
            Token20.transferFrom(msg.sender, prom, camp.fee); // pay the promoter
            Token20.transferFrom(msg.sender, address(this), cfee); // pay the contract
        } else {
            require(msg.value >= camp.price);
            payable(camp.owner).transfer(pay); // pay nft
            Token721.transferFrom(camp.owner, msg.sender, camp.tokenId); // send the nft
            payable(prom).transfer(camp.fee); // send the nft
            payable(address(this)).transfer(cfee); // pay the contract
        }
        txs.push(Transactions(t, _rlid, cid, block.timestamp));
        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("became producer"),
            block.timestamp
        );
        init.setLogs(); // iterate log
        t++; // log
        return true;
    }
    /*
    function withdraw(uint256 _eth, uint256 _mlq) isAdmin() external returns(bool){
        require(_mlq * 10 ** 18 <= iMLQ.balanceOf(address(this)));
        require(_eth * 10 ** 18 <= address(this).balance);
        iMLQ.transfer(payable(msg.sender), _mlq * 10 ** 18);
        payable(msg.sender).transfer(_eth * 10 ** 18);
        return true;
    }
    */
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract TKN_Project is ERC20 {
    uint256 maxTKN;
    address admin;
    address avax;
    string img;
    uint256 digits;

    constructor(
        address _author,
        address _avax,
        uint256 _max,
        string memory _name,
        string memory _sym,
        string memory _baseUri,
        uint256 _n
    ) ERC20(_name, _sym) {
        maxTKN = _max;
        admin = _author;
        avax = _avax;
        img = _baseUri;
        digits = 10**(18 - _n);
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract NFT_Project is ERC721URIStorage {
    // counter class
    using Counters for Counters.Counter;
    // iterator for token ids
    Counters.Counter internal _tokenIds;
    // admin account = author
    address internal admin;
    address internal avax;
    //      user    => amount
    mapping(address => uint256) public myNFTAmount;
    //      user    => wallet id        => token id
    mapping(address => mapping(uint256 => uint256)) public myNFTs;
    //      token id    => token uri
    mapping(uint256 => string) public _tokenURIz;
    // total amount of minted tokens
    uint256 public total;
    // maximum amount of tokens to mint
    uint256 public max;
    // base uri that points to ipfs
    string internal baseURI;
    // decimal spaces wanted at eth level
    uint256 internal digits;
    // maximum amount of tokens per lootbox
    uint256 internal maxBoxSize;

    constructor(
        address _author,
        address _avax,
        uint256 _max,
        string memory _name,
        string memory _sym,
        string memory _baseUri,
        uint256 _n,
        uint256 _m
    ) ERC721(_name, _sym) {
        admin = _author; // author from input
        avax = _avax;
        max = _max;
        total = 1;
        baseURI = _baseUri;
        digits = 10**(18 - _n);
        maxBoxSize = _m;
    }

    function mintToken() external payable returns (bool) {
        require(msg.value >= 1 * digits, "insuficient balance ...");
        require(myNFTAmount[msg.sender] <= maxBoxSize, "max limit reached ...");
        _mint(msg.sender, total);
        _tokenURIz[total] = tokenURI(total);
        myNFTs[msg.sender][myNFTAmount[msg.sender]] = total;
        myNFTAmount[msg.sender]++;
        total++;
        return true;
    }

    function dropToken() external returns (bool) {
        require(myNFTAmount[msg.sender] == 0, "max limit reached ...");
        _mint(msg.sender, total);
        _tokenURIz[total] = tokenURI(total);
        myNFTs[msg.sender][myNFTAmount[msg.sender]] = total;
        myNFTAmount[msg.sender]++;
        total++;
        return true;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721URIStorage: URI query for nonexistent token"
        );
        string memory idstring = Strings.toString(tokenId);
        string memory diasPath = append(baseURI, "/", idstring);
        return diasPath;
    }

    function withdrawAll() external payable returns (bool) {
        require(admin == msg.sender, "not authorized ...");
        require(admin.balance >= 1 * digits);
        payable(admin).transfer(admin.balance);
        return true;
    }

    function append(
        string memory a,
        string memory b,
        string memory c
    ) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b, c));
    }

    fallback() external {}
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract SFT_Project is ERC1155 {
    address internal admin;
    //      user    => amount
    mapping(address => uint256) public myNFTAmount;
    //      user    => wallet id        => token id
    mapping(address => mapping(uint256 => uint256)) public myNFTs;
    //      token id    => token uri
    mapping(uint256 => string) public _tokenURIz;
    // total amount of minted tokens
    uint256 public total;
    // maximum amount of tokens to mint
    uint256 public max;
    // base uri that points to ipfs
    string internal baseURI;
    // decimal spaces wanted at eth level
    uint256 internal digits;
    // maximum amount of tokens per lootbox
    uint256 internal maxBoxSize;

    constructor(
        address _author,
        uint256 _max,
        string memory _name,
        string memory _baseUri,
        uint256 _n,
        uint256 _m
    ) ERC1155(_name) {
        admin = _author; // author from input
        max = _max;
        total = 1;
        baseURI = _baseUri;
        digits = 10**(18 - _n);
        maxBoxSize = _m;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract TKN_Factory is InitFace, TokenomicSets {
    mapping(uint256 => address) public projects;
    mapping(address => ERC20) public projectMap;
    uint256 public contracts;
    uint256 internal digits;
    // ERC721 internal project;
    TKN_Project internal project;

    constructor(address _initAdr) InitFace(_initAdr) {
        digits = fx.findig;
    }

    function makeProject(
        address _author,
        address _avax,
        uint256 _max,
        string memory _name,
        string memory _sym,
        string memory _uri,
        uint256 _n
    ) external returns (address) {
        project = new TKN_Project(_author, _avax, _max, _name, _sym, _uri, _n);
        address a = address(project);
        projects[contracts] = a;
        projectMap[a] = project;
        contracts++;
        return a;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract NFT_Factory is InitFace, TokenomicSets {
    mapping(uint256 => address) public projects;
    mapping(address => ERC721) public projectMap;
    uint256 public contracts;
    uint256 internal digits;
    // ERC721 internal project;
    NFT_Project internal project;

    constructor(address _initAdr) InitFace(_initAdr) {
        digits = fx.findig;
    }

    function makeProject(
        address _author,
        address _avax,
        uint256 _max,
        string memory _name,
        string memory _sym,
        string memory _uri,
        uint256 _n,
        uint256 _m
    ) external returns (address) {
        project = new NFT_Project(
            _author,
            _avax,
            _max,
            _name,
            _sym,
            _uri,
            _n,
            _m
        );
        address a = address(project);
        projects[contracts] = a;
        projectMap[a] = project;
        contracts++;
        return a;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract SFT_Factory is InitFace, TokenomicSets {
    mapping(uint256 => address) public projects;
    mapping(address => ERC1155) public projectMap;
    uint256 public contracts;
    uint256 internal digits;
    // ERC721 internal project;
    SFT_Project internal project;

    constructor(address _initAdr) InitFace(_initAdr) {
        digits = fx.findig;
    }

    function makeProject(
        address _author,
        uint256 _max,
        string memory _name,
        string memory _uri,
        uint256 _n,
        uint256 _m
    ) external returns (address) {
        project = new SFT_Project(_author, _max, _name, _uri, _n, _m);
        address a = address(project);
        projects[contracts] = a;
        projectMap[a] = project;
        contracts++;
        return a;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract PoolMaker is ERC20, InitFace, TokenomicSets {
    event Log(
        uint256 indexed id,
        address sender,
        address home,
        uint256 num,
        bytes message,
        uint256 time
    );
    mapping(uint256 => address) public projects;
    mapping(address => ERC1155) public projectMap;
    uint256 public contracts;
    uint256 internal digits;
    IERC20 public WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    IERC20 public rSHK;
    IERC20 public low;
    IERC20 public high;
    IERC20 internal Token;

    mapping(address => uint256) stakedWETH;
    mapping(address => uint256) stakedSHK;

    //pool Id => user => lowCurrencyQuantity
    mapping(uint256 => mapping(address => uint256)) addedLiquidity;
    struct Transaction {
        uint256 id;
        address user;
        address token1;
        uint256 amount1;
        address token2;
        uint256 amount2;
        uint256 time;
    }
    Transaction[] public txs;
    uint256 txCount;

    struct Liquidity {
        uint256 id;
        address lowCurrency;
        address highCurrency;
        uint256 maxSizeLow;
        uint256 maxSizeHigh;
        uint256 currSizeLow;
        uint256 currSizeHigh;
        uint256 rate;
        uint256 fee;
    }
    Liquidity[] public pools;
    uint256 poolCount;

    constructor(address _initAdr, address _rSHK)
        ERC20("Shake Token", "SHK")
        InitFace(_initAdr)
    {
        digits = fx.findig;
        rSHK = IERC20(_rSHK);
    }

    function makePool(
        address lowCurrency,
        address highCurrency,
        uint256 lowSize,
        uint256 highSize,
        uint256 rate,
        uint256 fee
    ) external returns (bool) {
        pools.push(
            Liquidity(
                poolCount,
                lowCurrency,
                highCurrency,
                lowSize,
                highSize,
                0,
                0,
                rate,
                fee
            )
        );
        poolCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            999,
            bytes("Pool made"),
            block.timestamp
        );
        init.setLogs();

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                lowCurrency,
                0,
                highCurrency,
                0,
                block.timestamp
            )
        );
        txCount++;

        return true;
    }

    function addLiquidity(uint256 _id, uint256 _lowAmount)
        external
        payable
        returns (bool)
    {
        Liquidity memory currPool = pools[_id];
        low = IERC20(currPool.lowCurrency);
        high = IERC20(currPool.highCurrency);

        uint256 _highAmount = _lowAmount * currPool.rate;
        require(low.balanceOf(msg.sender) >= _lowAmount, "invalid amount");
        require(high.balanceOf(msg.sender) >= _highAmount, "invalid amount");
        require(low.allowance(msg.sender, address(this)) >= _lowAmount);
        require(high.allowance(msg.sender, address(this)) >= _highAmount);
        require((currPool.maxSizeLow - currPool.currSizeLow) >= _lowAmount);

        // todo: Optional? Require that the transferFrom txs are successful before minting
        low.transferFrom(msg.sender, address(this), _lowAmount);
        high.transferFrom(msg.sender, address(this), _highAmount);

        //PercentageOfTotalPoolSize = (100 / maxSIze) * _lowAmount
        uint256 sharePercentage = _divide(10**8, currPool.maxSizeLow) *
            _lowAmount;

        _mint(msg.sender, sharePercentage);

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                currPool.lowCurrency,
                _lowAmount,
                currPool.highCurrency,
                _highAmount,
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _lowAmount,
            bytes("Liquidity added"),
            block.timestamp
        );
        init.setLogs();

        currPool.currSizeLow += _lowAmount;
        addedLiquidity[currPool.id][msg.sender] += _lowAmount;
        return true;
    }

    function removeLiquidity(uint256 _id, uint256 _lowAmount)
        external
        payable
        returns (bool)
    {
        Liquidity memory currPool = pools[_id];
        require(addedLiquidity[currPool.id][msg.sender] >= _lowAmount);
        require(currPool.currSizeLow >= _lowAmount);
        low = IERC20(currPool.lowCurrency);
        high = IERC20(currPool.highCurrency);

        uint256 _highAmount = _lowAmount * currPool.rate;
        addedLiquidity[currPool.id][msg.sender] -= _lowAmount;
        currPool.currSizeLow -= _lowAmount;
        low.transfer(msg.sender, _lowAmount);
        high.transfer(msg.sender, _highAmount);

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                currPool.lowCurrency,
                _lowAmount,
                currPool.highCurrency,
                _highAmount,
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _lowAmount,
            bytes("Liquidity removed"),
            block.timestamp
        );
        init.setLogs();

        return true;
    }

    function stakeSHK(uint256 _amount) external returns (bool) {
        require(balanceOf(msg.sender) >= _amount, "Invalid amount");
        transferFrom(msg.sender, address(this), _amount);
        stakedSHK[msg.sender] += _amount;

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                address(this), //todo: replace with address of SHK token
                _amount,
                address(0x0),
                0,
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _amount,
            bytes("Tokens staked"),
            block.timestamp
        );
        init.setLogs();

        return true;
    }

    //TODO: Declare rSHK, calculate amount of rSHK for staking
    function unstakeSHK(uint256 _amount) external returns (bool) {
        require(stakedSHK[msg.sender] >= _amount, "Invalid amount");
        stakedSHK[msg.sender] -= _amount;
        transfer(msg.sender, _amount);

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                address(this), //todo: replace with address of SHK token
                _amount,
                address(0x0), // //todo: replace with address of rSHK token
                0, // replace with amount (according to staked value and timeframe)
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _amount,
            bytes("Tokens unstaked"),
            block.timestamp
        );
        init.setLogs();

        return true;
    }

    function swapLowHigh(uint256 _id, uint256 _lowAmount)
        public
        payable
        returns (bool)
    {
        Liquidity memory currPool = pools[_id];
        low = IERC20(currPool.lowCurrency);
        high = IERC20(currPool.highCurrency);

        require(low.balanceOf(msg.sender) >= _lowAmount);
        require(_lowAmount + currPool.currSizeLow <= currPool.maxSizeLow);

        uint256 _highAmount = currPool.rate * _lowAmount;

        // IDK if this is necessary or if Solidity reverts in case value goes under 0 (since its an uint and not an int)
        require(currPool.currSizeHigh - _highAmount >= 0);

        uint256 adminFee = _divide((_lowAmount * currPool.fee), 100);
        uint256 amountOut = _highAmount - adminFee;

        // low.transferFrom(msg.sender, admin, adminFee);
        low.transferFrom(msg.sender, address(this), _lowAmount);

        currPool.currSizeLow += _lowAmount;
        currPool.currSizeHigh -= amountOut;
        high.transferFrom(address(this), msg.sender, amountOut);

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                currPool.lowCurrency,
                _lowAmount,
                currPool.highCurrency,
                amountOut,
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _lowAmount,
            bytes("Swapped low-high"),
            block.timestamp
        );
        init.setLogs();

        return true;
    }

    function swapHIghLow(uint256 _id, uint256 _highAmount)
        public
        payable
        returns (bool)
    {
        Liquidity memory currPool = pools[_id];
        low = IERC20(currPool.lowCurrency);
        high = IERC20(currPool.highCurrency);

        require(high.balanceOf(msg.sender) >= _highAmount);
        require(_highAmount + currPool.currSizeHigh <= currPool.maxSizeHigh);

        uint256 _lowAmount = currPool.rate * _highAmount;

        // IDK if this is necessary or if Solidity reverts in case value goes under 0 (since its an uint and not an int)
        require(currPool.currSizeLow - _lowAmount >= 0);

        uint256 adminFee = _divide((_highAmount * currPool.fee), 100); //check math
        uint256 amountOut = _lowAmount - adminFee;
        // high.transferFrom(msg.sender, admin, adminFee);
        high.transferFrom(msg.sender, address(this), amountOut);
        currPool.currSizeHigh += _highAmount;
        currPool.currSizeLow -= amountOut;
        low.transferFrom(address(this), msg.sender, _highAmount);

        txs.push(
            Transaction(
                txCount,
                msg.sender,
                currPool.highCurrency,
                _highAmount,
                currPool.lowCurrency,
                amountOut,
                block.timestamp
            )
        );
        txCount++;

        emit Log(
            init.getLogs(),
            msg.sender,
            address(this),
            _highAmount,
            bytes("Swapped high-low"),
            block.timestamp
        );
        init.setLogs();

        return true;
    }

    function _divide(uint256 _a, uint256 _b)
        internal
        pure
        returns (uint256 res)
    {
        uint256 rem = _a % _b;
        res = (_a - rem) / _b;
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Connect is InitFace, TokenomicSets {
    constructor(
        address _auth,
        address _avax,
        address _initAdr
    ) InitFace(_initAdr) {}

    struct Connection {
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
    event Log(
        uint256 indexed id,
        address sender,
        address home,
        uint256 num,
        string message,
        uint256 stamp
    );
    uint256 logs;
    struct Content {
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

    struct Convo {
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
    mapping(address => mapping(address => mapping(uint256 => uint256)))
        public dmConvos;
    mapping(address => uint256) internal myCV;
    Convo[] public convos;
    uint256 internal g = 1;
    mapping(uint256 => uint256) internal convoSafe;

    function follow(address _to) external returns (bool) {
        address small = msg.sender;
        address big = _to;
        if (_to == smaller(_to, msg.sender)) {
            small = _to;
            big = msg.sender;
        }
        if (connected[small][big] == true) {
            uint256 revId = myConnex[_to][msg.sender];
            connex[revId].authorize = 3;
            connex[revId].mode = 2;
            connex.push(Connection(c, msg.sender, _to, 3, 2));
            emit Log(
                logs,
                msg.sender,
                address(this),
                c,
                "double connex created",
                block.timestamp
            );
        } else {
            connected[small][big] = true;
            connex.push(Connection(c, msg.sender, _to, 6, 3));
            emit Log(
                logs,
                msg.sender,
                address(this),
                c,
                "connex created",
                block.timestamp
            );
        }
        myConnex[msg.sender][_to] = c - 1;
        cxCount[msg.sender]++;
        c++;
        return true;
    }

    function setRelation(
        address _to,
        uint256 _auth,
        uint256 _mode
    ) external returns (bool) {
        uint256 revId = myConnex[msg.sender][_to];
        connex[revId].authorize = _auth;
        connex[revId].mode = _mode;
        emit Log(
            logs,
            msg.sender,
            address(this),
            revId,
            "connex updated",
            block.timestamp
        );
        return true;
    }

    function smaller(address _a, address _b) internal pure returns (address) {
        address ret;
        if (_a < _b) {
            ret = _a;
        } else if (_a > _b) {
            ret = _b;
        }
        return ret;
    }

    function createConvo(string memory _desc, uint256 _uMax)
        internal
        returns (bool)
    {
        convos.push(
            Convo(
                g,
                bytes(_desc),
                msg.sender,
                0,
                0,
                1,
                0,
                block.timestamp,
                _uMax
            )
        );
        usersByConvo[g][0] = msg.sender;
        myConvo[msg.sender][myCV[msg.sender]] = g;
        myCV[msg.sender]++;
        g++;
        emit Log(
            logs,
            msg.sender,
            address(this),
            g - 1,
            "convo created",
            block.timestamp
        );
        logs++;
        return true;
    }

    function addUserToConvo(address _user, uint256 _gid)
        internal
        returns (bool)
    {
        require(convos[_gid].maxU > convos[_gid].uSize, "no space in group");
        require(
            connex[myConnex[_user][msg.sender]].following == msg.sender,
            "user doesn't follow you"
        );
        require(
            connex[myConnex[_user][msg.sender]].authorize <= 4,
            "you are not authorized"
        );
        Convo memory convo = convos[_gid];
        usersByConvo[_gid][convo.uSize] = _user;
        require(
            _user != 0x0000000000000000000000000000000000000000,
            "did not add user to convo"
        );
        convos[_gid].uSize++;
        emit Log(
            logs,
            msg.sender,
            address(this),
            convo.uSize,
            "group size updated",
            block.timestamp
        );
        return true;
    }

    function addContentToConvo(
        uint256 _gid,
        uint256 _lvl,
        uint256 _cTyp,
        uint256 _pTyp,
        uint256 _price,
        string memory _cnt
    ) internal returns (bool) {
        Convo memory convo = convos[_gid];
        if (_pTyp == 1) {
            // mint 1 ERC721
        }
        if (_pTyp >= 2) {
            // mint x ERC1155
        }
        posts.push(
            Content(
                p,
                msg.sender,
                _lvl,
                _cTyp,
                _pTyp,
                _price,
                bytes(_cnt),
                0,
                0
            )
        );
        myContent[msg.sender][myCC[msg.sender]] = p;
        contentByConvo[_gid][convo.cSize] = p;
        convos[_gid].last = block.timestamp;
        convos[_gid].cSize++;
        myCC[msg.sender]++;
        p++;
        emit Log(
            logs,
            msg.sender,
            address(this),
            convo.cSize,
            "content count updated",
            block.timestamp
        );
        return true;
    }

    function showContent(uint256 _pid) internal returns (string memory) {
        if (posts[_pid].views == 0) unread[msg.sender]--;
        posts[_pid].views++;
        return string(posts[_pid].content);
    }

    function writeDM(address _to, string memory _msg) external returns (bool) {
        // require user knows sender
        require(
            connex[myConnex[_to][msg.sender]].following == msg.sender,
            "the reciever doesnt know you !"
        );
        // check if valid convo exists
        address small = msg.sender;
        address big = _to;
        if (_to == smaller(_to, msg.sender)) {
            small = _to;
            big = msg.sender;
        }
        uint256 dmc = dmConvoCount[small][big];
        if (dmc == 0) {
            // first convo
            uint256 convoId = g - 1;
            bool success = createConvo("direct message", 2);
            require(success, "did not create convo");
            (success) = addUserToConvo(_to, convoId);
            require(success, "did not add user");
            (success) = addContentToConvo(convoId, 3, 0, 0, 0, _msg);
            require(success, "did not add content");
            dmConvos[small][big][dmConvoCount[small][big]] = convoId;
            dmConvoCount[small][big]++;
            allDMCs[msg.sender][myDMCs[msg.sender]] = convoId;
            allDMCs[_to][myDMCs[_to]] = convoId;
            myDMCs[msg.sender]++;
            myDMCs[_to]++;
            unread[_to]++;
            emit Log(
                logs,
                msg.sender,
                address(this),
                convoId,
                "new convo msg",
                block.timestamp
            );
            return true;
        } else {
            // check if last convo is still valid
            uint256 fortyeight = (60 * 60 * 48);
            uint256 co = dmConvos[small][big][(dmc - 1)];
            if (convos[co].last > (block.timestamp - fortyeight)) {
                // still valid convo
                addContentToConvo((dmc - 1), 3, 0, 0, 0, _msg);
                unread[_to]++;
                emit Log(
                    logs,
                    msg.sender,
                    address(this),
                    co,
                    "existing convo msg",
                    block.timestamp
                );
                return true;
            } else {
                // next convo
                uint256 convoId = g - 1;
                createConvo("direct message", 2);
                addUserToConvo(_to, convoId);
                addContentToConvo(convoId, 2, 0, 0, 0, _msg);
                dmConvos[small][big][dmConvoCount[small][big]] = convoId;
                dmConvoCount[small][big]++;
                myDMCs[msg.sender]++;
                myDMCs[_to]++;
                unread[_to]++;
                emit Log(
                    logs,
                    msg.sender,
                    address(this),
                    convoId,
                    "next convo msg",
                    block.timestamp
                );
                return true;
            }
        }
    }

    function getLastContent(uint256 _cid, uint256 _next)
        external
        view
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 convoUsers = convos[_cid].uSize;
        uint256 i = 0;
        bool tr = false;
        while (i < convoUsers) {
            if (msg.sender == usersByConvo[_cid][i]) tr = true;
            if (msg.sender == convos[_cid].owner) tr = true;
            i++;
        }
        require(tr == true, "not a member of convo");
        uint256 contentCount = convos[_cid].cSize;
        return (
            contentByConvo[_cid][contentCount - 1 - (3 * _next)] - 1,
            contentByConvo[_cid][contentCount - 2 - (3 * _next)] - 1,
            contentByConvo[_cid][contentCount - 3 - (3 * _next)] - 1
        );
    }

    function createCollection(string memory _desc, uint256 _typ)
        external
        returns (bool)
    {
        if (_typ == 0) {
            // on-chain
        }
        if (_typ == 1) {
            // erc1155
        }
        if (_typ == 2) {
            // erc721
        }
    }
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract DirectMessage {

}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Blog {

}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Collection {

}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Shop {

}

// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
contract Entertainment {

}
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//  *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
//                                                                                                                                                                                  //
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
