//////////////////////////////////////////
//                                      //
//          MAIN CONTRACT               //
//          III6 LifeAnd.Eth            //
//          stereoIII6                  //
//          stereodocbush@gmail.com      //
//                                      //
//////////////////////////////////////////

import { ethers } from "ethers";
import detectEthereumProvider from "@metamask/detect-provider";
import "../public/app.scss";
import {sha256} from 'crypto-hash';
const client = require('ipfs-http-client');
// console.log(client);
const ipfs = client.create({host: "ipfs.infura.io",
port: "5001",
protocol: "https"});
const Init = require("../dist/contracts/Init.json");
const List = require("../dist/contracts/List.json");
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

let accounts = [];
const mlq = "0x0"; 
const vyz = "0x0"; 
const lyx = "0x0"; 
const impct = "0x0"; 
let profile = {}; 

const token_btn = document.getElementById("token_btn");
const gov_btn = document.getElementById("gov_btn");
const info_btn = document.getElementById("info_btn");
const home_btn = document.getElementById("home_btn");
const logo = document.getElementById("logo");
const profile_btn = document.getElementById("profile_btn");
const wallet_btn = document.getElementById("wallet_btn");
const net_btn = document.getElementById("net_btn");

const token_stage = document.getElementById("token_stage");
const gov_stage = document.getElementById("gov_stage");
const home_stage = document.getElementById("home_stage");
const info_stage = document.getElementById("info_stage");
const user_stage = document.getElementById("user_stage");
const modal = document.getElementById("modal");
const modalhead = document.getElementById("modalhead");
const modalbody = document.getElementById("modalbody");
const modalfoot = document.getElementById("modalfoot");
const article_body = document.getElementById("article_bodyUS");
const ufSubmit = document.getElementById("user_form_submit");
const usimg = document.getElementById("us_img");
const submit_uform = document.getElementById("user_form_submit");
const uname = document.getElementById("uname_inp");
const umail = document.getElementById("umail_inp");
const unum = document.getElementById("unum_inp");
const utwt = document.getElementById("utwt_inp");
const usts = document.getElementById("usts_inp");
const uavt = document.getElementById("uavt_inp");

const s0xCon = async () => {
    const deploymentKey = Object.keys(Init.networks)[0];
    console.log(Init.abi,Init.networks[deploymentKey].address,signer);
    return new ethers.Contract(
      Init.networks[deploymentKey].address,
      Init.abi,
      signer
    );
  };
const showTokens = (e) => {
    e.preventDefault();
    console.log(e.target);
    token_stage.style.display = "grid";
    gov_stage.style.display = "none";
    home_stage.style.display = "none";
    info_stage.style.display = "none";
    user_stage.style.display = "none";

}
const showGov = (e) => {
    e.preventDefault();
    console.log(e.target);
    gov_stage.style.display = "grid";
    token_stage.style.display = "none";
    home_stage.style.display = "none";
    info_stage.style.display = "none";
    user_stage.style.display = "none";
}
const showHome = (e) => {
    e.preventDefault();
    console.log(e.target);
    gov_stage.style.display = "none";
    token_stage.style.display = "none";
    home_stage.style.display = "grid";
    info_stage.style.display = "none";
    user_stage.style.display = "none";
}
const showInfo = (e) => {
    e.preventDefault();
    console.log(e.target);
    gov_stage.style.display = "none";
    token_stage.style.display = "none";
    home_stage.style.display = "none";
    info_stage.style.display = "grid";
    user_stage.style.display = "none";
}
const showUser = (e) => {
    e.preventDefault();
    console.log(e.target);
    gov_stage.style.display = "none";
    token_stage.style.display = "none";
    home_stage.style.display = "none";
    info_stage.style.display = "none";
    user_stage.style.display = "grid";
}
const showNetMenu = (e) => {
    e.preventDefault();
    console.log(e.target);
    modalhead.innerHTML = "<h1>please select a network</h1>";
    modalbody.innerHTML = "<div></div>";
    modalbody.innerHTML += "<button id='eth' class='box'>ETH Mainnet</button>";
    modalbody.innerHTML += "<button id='poly' class='box'>Polygon Mainnet</button>";
    modalbody.innerHTML += "<button id='opti' class='box'>Optimism Mainnet</button>";
    modalbody.innerHTML += "<button id='avax' class='box'>Avalanche Mainnet</button>";
    modalbody.innerHTML += "<button id='celo' class='box'>Celo Mainnet</button>";
    modalfoot.innerHTML = "<h3>you will be directed to a metamask popup</h3>";
    modal.style.display = "grid";
}
const submitUserForm = async (e) => {
    e.preventDefault();
    const s0x = await s0xCon();
    console.log(e.target);
    const obj = {
        username: uname.value,
        usermail: umail.value,
        usertel: unum.value,
        usertwt: utwt.value,
        userstatus: usts.value,
        useravt: uavt.value 
    }
    console.log(obj);
    const makeU = await s0x.makeU(obj)
    // push object & make user 
    
}
token_btn.addEventListener("click", showTokens);
gov_btn.addEventListener("click", showGov);
info_btn.addEventListener("click", showInfo);
home_btn.addEventListener("click", showHome);
logo.addEventListener("click", showHome);
profile_btn.addEventListener("click", showUser);
net_btn.addEventListener("click",showNetMenu);
submit_uform.addEventListener("click", submitUserForm);

const initialize = () => {
    modal.style.display = "none";
    //Basic Actions Section
    const isMetaMaskInstalled = () => {
        //Have to check the ethereum binding on the window object to see if it's installed
        const { ethereum } = window;
        return Boolean(ethereum && ethereum.isMetaMask);
    };

    
    
    const netCheck = async (e) => {
        // console.log("go");
        try {
            // Will open the MetaMask UI
            profile_btn.innerHTML = 'Connecting ...';
            // You should disable this button while the request is pending!
            await ethereum.request({ method: 'eth_requestAccounts' });
           // console.log("what");
           // const accounts = await ethereum.request({ method: 'eth_accounts' });
            const network = await ethereum.request({method: 'net_version'});
            var networkTag = "Switch Network";
          //We take the first address in the array of addresses and display it
                              if(Number(network) === 80001) networkTag =  "Mumbai";
                              if(Number(network) === 1) networkTag =  "ETH";
                              if(Number(network) === 137) networkTag =  "Polygon";
                              if(Number(network) === 100) networkTag =  "xDai";
                              if(Number(network) === 10) networkTag =  "Optimism";
                              if(Number(network) === 200) networkTag =  "Arbitrum";
                              if(Number(network) === 43224) networkTag =  "Avalanche";
                              if(Number(network) === 43113) networkTag =  "Fuji";
                              if(Number(network) === 1312) networkTag = "ACAB";
          net_btn.innerHTML = networkTag;
          profile = await log();
          console.log(profile);
          
          } catch (error) {
            console.error(error);
            profile_btn.innerText = 'error';
          }
    }
    const clickInstall = () => {
        alert("You are being redirected to the official download of Metamask.io ... Please Follow their installation instructions.");
        window.open("https://metamask.io");
    };
    const log = async () => {
        const s0x = await s0xCon();
        accounts = await ethereum.request({ method: 'eth_accounts' });
        console.log(accounts[0],provider.getCode(accounts[0]));
        
        const isUser = await s0x.isUserBool(accounts[0]);
        
        if(!isUser) { // 
            console.log(isUser);
            profile_btn.innerHTML = accounts[0].slice(0,4)+"..."+accounts[0].slice(39,42);
            ufSubmit.addEventListener("click", submitUserForm);
            return isUser;
        }
        else {
            console.log(isUser);
            const role = await s0x.getRole(accounts[0]);
            if(Number(role._hex) >= 99) {
                profile_btn.style.background = "tomato";
                profile_btn.style.border = "1px solid black";
                profile_btn.style.color = "black";
            }
            let profileGrab = await s0x.showU(); 
            console.log(profileGrab);
            profile = JSON.parse(profileGrab[0]);
            article_body.innerHTML = "<div id='heading' class='list'><h3>@"+profile.username+"</h3><p>"+profile.usermail+"</p><p>"+profile.usertel+"</p><h2>'"+profile.userstatus+"'</h2></div>";
            usimg.src = profile.useravt;
            profile_btn.innerHTML = "@"+profile.username;
            return profile;
        }
    };

    const MetaMaskClientCheck = () => {
        //Now we check to see if MetaMask is installed
        if (!isMetaMaskInstalled()) {
        //If it isn't installed we ask the user to click to install it
        profile_btn.value = 'Click here to install MetaMask!';
        profile_btn.addEventListener("click",clickInstall);
        } else {
        //If it is installed we change our button text
        profile_btn.disabled = true;
        profile_btn.value = 'Get Listed !'
        profile_btn.addEventListener("click",netCheck);
        }
    };
    MetaMaskClientCheck();
}
initialize();




