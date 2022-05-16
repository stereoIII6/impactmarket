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
// const s0xiety = require("../build/contracts/s0xiety.json");
const List = require("../build/contracts/List.json");
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

const token_btn = document.getElementById("token_btn");
const gov_btn = document.getElementById("gov_btn");
const info_btn = document.getElementById("info_btn");
const home_btn = document.getElementById("home_btn");
const profile_btn = document.getElementById("profile_btn");
const wallet_btn = document.getElementById("wallet_btn");
const net_btn = document.getElementById("net_btn");

const token_stage = document.getElementById("token_stage");
const gov_stage = document.getElementById("gov_stage");
const home_stage = document.getElementById("home_stage");
const info_stage = document.getElementById("info_stage");
const user_stage = document.getElementById("user_stage");
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
token_btn.addEventListener("click", showTokens);
gov_btn.addEventListener("click", showGov);
info_btn.addEventListener("click", showInfo);
home_btn.addEventListener("click", showHome);
profile_btn.addEventListener("click", showUser);


const initialize = () => {
    //Basic Actions Section
    const isMetaMaskInstalled = () => {
        //Have to check the ethereum binding on the window object to see if it's installed
        const { ethereum } = window;
        return Boolean(ethereum && ethereum.isMetaMask);
    };
    const whiteList = async (e) => {
        console.log("go");
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
                              if(Number(network) === 1312) networkTag = "ACAB";
          net_btn.innerHTML = networkTag;
          const UserData = await log();
          // console.log(UserData);
          
          } catch (error) {
            console.error(error);
            profile_btn.innerText = 'GET WHITELISTED !';
          }
    }
    const clickInstall = () => {
        alert("You are being redirected to the official download of Metamask.io ... Please Follow their installation instructions.");
        window.open("https://metamask.io");
    };
    const log = async () => {
   
        const accounts = await ethereum.request({ method: 'eth_accounts' });
        const List = await ListData();
        
        const sign = signer.signMessage(namein.value+" "+emailin);
       
        const make = await List.makeUser(namein.value,emailin.value,"datastream").then(result => { console.log(result); return result; });
        form.innerHTML = "<div id='txt'><h1>YOUR TX IS ON ITS WAY</h1><p>You are now signed up and will recieve all information via email soon !</p><p>Join us on our social media <a href='https://discord.gg/qVYG38PNyZ'>DISCORD</a> <a href=''>TWITTER</a></p>";
        
        // const show = await List.readUser().then(result => { console.log(result); return result; });
    };
    const ListData = async () => {
    
        const deploymentKey = Object.keys(List.networks)[0];
        // console.log(s0xiety.abi,provider);
        return new ethers.Contract(
                List
                .networks[deploymentKey]
                .address, List.abi, signer
        );
    }
    const MetaMaskClientCheck = () => {
        //Now we check to see if MetaMask is installed
        if (!isMetaMaskInstalled()) {
        //If it isn't installed we ask the user to click to install it
        profile_btn.value = 'Click here to install MetaMask!';
        profile_btn.addEventListener("click",clickInstall);
        } else {
        //If it is installed we change our button text
        profile_btn.disabled = true;
        profile_btn.style.opacity = 0.8;
        profile_btn.value = 'Get Listed !'
        profile_btn.addEventListener("click",whiteList);
        }
    };
    MetaMaskClientCheck();
}
initialize();




