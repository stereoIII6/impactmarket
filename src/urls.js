require('dotenv').config();
let APIKEY = process.env.POLY_API;
// Wallet balance
const urlWalletBalanceOf = (adr,cnt) => {
    return "https://api.polygonscan.com/api?module=account&action=tokenbalance&contractaddress="+cnt+"&address="+adr+"&tag=latest&apikey="+APIKEY;
}
// Token Total Supply
const urlTotalSupplyOf = (cnt) => {
    return "https://api.polygonscan.com/api?module=stats&action=tokensupply&contractaddress="+cnt+"&apikey="+APIKEY;
}
// Account Balance Matic
const urlAccountBalanceOf = (adr) => {
    return "https://api.polygonscan.com/api?module=account&action=balance&address="+adr+"&apikey="+APIKEY;
}
// TX Receipt
const urlTxReceipt = (hsh) => {
    return "https://api.polygonscan.com/api?module=transaction&action=gettxreceiptstatus&txhash="+hsh+"&apikey="+APIKEY;
}
