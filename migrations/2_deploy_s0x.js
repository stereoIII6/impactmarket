require('dotenv').config();

// const s0xiety = artifacts.require("s0xiety");
const Init = artifacts.require("Init");


module.exports = function (deployer) {
  // deployer.deploy(s0xiety, process.env.ADMIN);
  deployer.deploy(Init,process.env.ADMIN,process.env.AVAX);

};

