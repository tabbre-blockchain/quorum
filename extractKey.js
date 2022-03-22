var keythereum = require("keythereum");
var datadir = "/home/tabbredev/quorum/testnet2/0/";
var address= "0x67af3be1a0cbca43d1f7342576ffd8c8daeffdc6";
const password = "Camborne72!*";

var keyObject = keythereum.importFromFile(address, datadir);
var privateKey = keythereum.recover(password, keyObject);
console.log(privateKey.toString('hex'));
