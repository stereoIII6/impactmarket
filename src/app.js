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

const walletin = document.getElementById('walletin');
const emailin = document.getElementById('email');
const namein = document.getElementById('name');
const form = document.getElementById("form");
const token_btn = document.getElementById("token_btn");
const gov_btn = document.getElementById("gov_btn");
const stage = document.getElementById("stage");
const token_stage = document.getElementById("token_stage");
const gov_stage = document.getElementById("gov_stage");
const showTokens = (e) => {
    e.preventDefault();
    console.log(e.target);
    stage.style.display = "none";
    token_stage.style.display = "grid";
    gov_stage.style.display = "none";
}
const showGov = (e) => {
    e.preventDefault();
    console.log(e.target);
    stage.style.display = "none";
    gov_stage.style.display = "grid";
    token_stage.style.display = "none";
}
token_btn.addEventListener("click", showTokens);
gov_btn.addEventListener("click", showGov);


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
            walletin.innerHTML = 'Connecting ...';
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
          walletin.innerHTML = networkTag;
          const UserData = await log();
          // console.log(UserData);
          
          } catch (error) {
            console.error(error);
            walletin.innerText = 'GET WHITELISTED !';
          }
    }
    const enable = (e) => {
        let x = 0;
        console.log(emailin.value.length,namein.value.length);
        if(emailin.value.length >= 10) x++;
        if(namein.value.length >= 6) x++;
        if(x == 2) {
            walletin.disabled = false;
            walletin.style.opacity = 1;
        }
        else if(x < 2) {
            walletin.disabled = true;
            walletin.style.opacity = 0.8;   
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
        walletin.value = 'Click here to install MetaMask!';
        walletin.addEventListener("click",clickInstall);
        } else {
        //If it is installed we change our button text
        walletin.disabled = true;
        walletin.style.opacity = 0.8;
        walletin.value = 'Get Listed !'
        walletin.addEventListener("click",whiteList);
        }
    };
    MetaMaskClientCheck();
}
initialize();




