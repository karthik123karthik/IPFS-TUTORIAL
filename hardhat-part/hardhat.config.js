require("@nomiclabs/hardhat-waffle");
require("dotenv").config({path:".env"});

const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY;
const MUMBAI_PRIVATE_KEY = process.env.MUMBAI_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.4",
  networks:{
    mumbai:{
     url:ALCHEMY_API_KEY,
     accounts:[MUMBAI_PRIVATE_KEY]
    }
  }
};
