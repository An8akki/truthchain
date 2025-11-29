const hre = require("hardhat");
const fs = require("fs");
const path = require("path");

async function main() {
    console.log("🚀 Starting TruthChain deployment...\n");

    // Get deployer account
    const [deployer] = await hre.ethers.getSigners();
    console.log("📝 Deploying contracts with account:", deployer.address);

    const balance = await hre.ethers.provider.getBalance(deployer.address);
    console.log("💰 Account balance:", hre.ethers.formatEther(balance), "ETH\n");

    // Deploy CreatorRegistry
    console.log("📋 Deploying CreatorRegistry...");
    const CreatorRegistry = await hre.ethers.getContractFactory("CreatorRegistry");
    const creatorRegistry = await CreatorRegistry.deploy();
    await creatorRegistry.waitForDeployment();
    const creatorRegistryAddress = await creatorRegistry.getAddress();
    console.log("✅ CreatorRegistry deployed to:", creatorRegistryAddress);

    // Deploy TruthChain
    console.log("\n📋 Deploying TruthChain...");
    const TruthChain = await hre.ethers.getContractFactory("TruthChain");
    const truthChain = await TruthChain.deploy(creatorRegistryAddress);
    await truthChain.waitForDeployment();
    const truthChainAddress = await truthChain.getAddress();
    console.log("✅ TruthChain deployed to:", truthChainAddress);

    // Save deployment addresses
    const deploymentInfo = {
        network: hre.network.name,
        creatorRegistry: creatorRegistryAddress,
        truthChain: truthChainAddress,
        deployer: deployer.address,
        timestamp: new Date().toISOString(),
    };

    const deploymentsDir = path.join(__dirname, "..", "deployments");
    if (!fs.existsSync(deploymentsDir)) {
        fs.mkdirSync(deploymentsDir);
    }

    const deploymentFile = path.join(
        deploymentsDir,
        `${hre.network.name}.json`
    );
    fs.writeFileSync(deploymentFile, JSON.stringify(deploymentInfo, null, 2));

    console.log("\n📄 Deployment info saved to:", deploymentFile);

    // Save ABIs for frontend
    const artifactsDir = path.join(__dirname, "..", "artifacts", "contracts");
    const frontendDir = path.join(__dirname, "..", "frontend", "lib", "contracts");

    if (!fs.existsSync(frontendDir)) {
        fs.mkdirSync(frontendDir, { recursive: true });
    }

    // Copy CreatorRegistry ABI
    const creatorRegistryArtifact = JSON.parse(
        fs.readFileSync(
            path.join(artifactsDir, "CreatorRegistry.sol", "CreatorRegistry.json")
        )
    );
    fs.writeFileSync(
        path.join(frontendDir, "CreatorRegistry.json"),
        JSON.stringify(
            {
                address: creatorRegistryAddress,
                abi: creatorRegistryArtifact.abi,
            },
            null,
            2
        )
    );

    // Copy TruthChain ABI
    const truthChainArtifact = JSON.parse(
        fs.readFileSync(
            path.join(artifactsDir, "TruthChain.sol", "TruthChain.json")
        )
    );
    fs.writeFileSync(
        path.join(frontendDir, "TruthChain.json"),
        JSON.stringify(
            {
                address: truthChainAddress,
                abi: truthChainArtifact.abi,
            },
            null,
            2
        )
    );

    console.log("✅ ABIs copied to frontend\n");

    console.log("🎉 Deployment completed successfully!\n");
    console.log("📝 Summary:");
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log("Network:", hre.network.name);
    console.log("CreatorRegistry:", creatorRegistryAddress);
    console.log("TruthChain:", truthChainAddress);
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

    // Verification instructions
    if (hre.network.name !== "hardhat" && hre.network.name !== "localhost") {
        console.log("📌 To verify contracts on Polygonscan, run:");
        console.log(
            `npx hardhat verify --network ${hre.network.name} ${creatorRegistryAddress}`
        );
        console.log(
            `npx hardhat verify --network ${hre.network.name} ${truthChainAddress} ${creatorRegistryAddress}`
        );
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
