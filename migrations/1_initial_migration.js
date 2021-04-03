const Migrations = artifacts.require("Migrations");
  const Storage=artifacts.require("Storage.sol");
  const ERC20Token=artifacts.require("ERC20Token")
module.exports = function (deployer) {
  deployer.deploy(Migrations);
  //deployer.deploy(Storage);
  deployer.deploy(ERC20Token,200000000000000000000);

};

