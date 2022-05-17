require('dotenv').config();

// const s0xiety = artifacts.require("s0xiety");
const Init = artifacts.require("Init");


module.exports = function (deployer) {
  // deployer.deploy(s0xiety, process.env.ADMIN);
  deployer.deploy(Init,'0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242','');

};

