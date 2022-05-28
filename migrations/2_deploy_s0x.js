require('dotenv').config();

// const s0xiety = artifacts.require("s0xiety");
const Init = artifacts.require("Init");
const Connect = artifacts.require("Connect");
const MLQ = artifacts.require("MLQ");
const VYZ = artifacts.require("TKN_Project");
const LYX = artifacts.require("TKN_Project");


module.exports = function (deployer) {
  // deployer.deploy(s0xiety, process.env.ADMIN);
  deployer.deploy(Init,process.env.ADMIN,process.env.AVAX);
  deployer.deploy(Connect);
  deployer.deploy(MLQ,process.env.ADMIN,process.env.AVAX);
  deployer.deploy(VYZ,process.env.ADMIN,process.env.AVAX,30000000000,"Impact View Tokens","VYZ","https://ipfs.io/ipfs/",4);
  deployer.deploy(LYX,process.env.ADMIN,process.env.AVAX,300000000,"Impact Like Tokens","LYX","https://ipfs.io/ipfs/",4);
};

