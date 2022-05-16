const {ethers} = require("hardhat");

const main = async()=>{
    const metaDataURI = "ipfs://Qmbygo38DWF1V8GttM1zy89KzyZTPU2FLUzQtiDvB7q6i5/"
    const LW3contractFactory = await ethers.getContractFactory("LW3Punks");
    const LW3Contract = await LW3contractFactory.deploy(metaDataURI);
    await LW3Contract.deployed();
    console.log("address :",LW3Contract.address);
}

main().then(()=> process.exit(0)).catch((error)=>{
    console.log(error);
    process.exit(1);
})