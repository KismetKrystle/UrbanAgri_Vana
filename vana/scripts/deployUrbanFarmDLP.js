const hre = require("hardhat");

async function main() {
  // Get the contract factory
  const UrbanFarmDLP = await hre.ethers.getContractFactory("UrbanFarmDLP");

  // Deploy the contract
  const urbanFarmDLP = await UrbanFarmDLP.deploy();

  // Wait for the deployment to complete
  await urbanFarmDLP.deployed();

  console.log("UrbanFarmDLP deployed to:", urbanFarmDLP.address);

  // Example interactions after deployment
  // Deposit tokens to a treasury for a test wallet
  const [owner] = await hre.ethers.getSigners();
  const depositAmount = ethers.utils.parseEther("10");
  await urbanFarmDLP.depositTokens(depositAmount);

  console.log(`Deposited ${depositAmount} tokens from owner: ${owner.address}`);

  // Add a sample urban farm solution
  const solutionTx = await urbanFarmDLP.submitSolution(
    "12345", // zipCode
    "Example City", // cityName
    "Green Community", // communityName
    "Urban", // communityType
    "Rich cultural heritage", // cultureDescription
    "Needs food security improvements", // foodSecurityNeeds
    42, // communityHealthRanking
    35, // foodDesertPercentage
    5000, // peopleAffectedByFoodDeserts
    70, // foodImportedPercentage
    ["Tomatoes", "Lettuce", "Peppers"], // topCropsInDemand
    "Limited water supply", // sustainableChallenges
    "https://example.com/image.png", // solutionImage
    "A hydroponic system for urban growth", // descriptiveText
    ["Lettuce", "Basil"], // suggestedPlants
    "NFT System", // hydroponicSystem
    500, // growSpaceNeeded (sq ft)
    ethers.utils.parseEther("1"), // startupCost (in Ether)
    ethers.utils.parseEther("3"), // annualIncome (in Ether)
    "Weekly harvest plan", // productionPlan
    "Improves local health and economy", // potentialImpactSummary
    "Community Center", // suggestedLocation
    1, // userId
    ethers.utils.parseEther("0.5") // tokens
  );

  await solutionTx.wait();
  console.log("Submitted sample solution.");
}

// Run the script
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
