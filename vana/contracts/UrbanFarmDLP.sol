// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanFarmDLP {
    // Struct for urban farming solution data
    struct UrbanFarmSolution {
        string zipCode;
        string cityName;
        string communityName;
        string communityType;
        string cultureDescription;
        string foodSecurityNeeds;
        uint256 communityHealthRanking;
        uint256 foodDesertPercentage;
        uint256 peopleAffectedByFoodDeserts;
        uint256 foodImportedPercentage;
        string[3] topCropsInDemand;
        string sustainableChallenges;
        string solutionImage; // URI to image
        string descriptiveText;
        string[] suggestedPlants;
        string hydroponicSystem;
        uint256 growSpaceNeeded; // Square feet
        uint256 startupCost; // Wei
        uint256 annualIncome; // Wei
        string productionPlan;
        string potentialImpactSummary;
        string suggestedLocation;
        uint256 userId;
    }

    // Struct for grow data
    struct GrowData {
        uint256 id;
        string label;
        string data;
    }

    // Array of solutions and mapping for grow data
    UrbanFarmSolution[] public solutions;
    mapping(uint256 => GrowData[]) public growData; // userId => grow data entries

    // Token treasury
    mapping(address => uint256) public tokenTreasury;

    // Events
    event SolutionSubmitted(uint256 indexed solutionId, uint256 indexed userId, address indexed contributor);
    event GrowDataAdded(uint256 indexed userId, uint256 indexed dataId, string label);
    event TokensDeposited(address indexed contributor, uint256 amount);

    // Modifier to check sufficient tokens
    modifier hasEnoughTokens(uint256 tokens) {
        require(tokenTreasury[msg.sender] >= tokens, "Insufficient tokens");
        _;
    }

    // Deposit tokens to the treasury
    function depositTokens(uint256 amount) public {
        tokenTreasury[msg.sender] += amount;
        emit TokensDeposited(msg.sender, amount);
    }

    // Submit an urban farming solution
    function submitSolution(
        string memory zipCode,
        string memory cityName,
        string memory communityName,
        string memory communityType,
        string memory cultureDescription,
        string memory foodSecurityNeeds,
        uint256 communityHealthRanking,
        uint256 foodDesertPercentage,
        uint256 peopleAffectedByFoodDeserts,
        uint256 foodImportedPercentage,
        string[3] memory topCropsInDemand,
        string memory sustainableChallenges,
        string memory solutionImage,
        string memory descriptiveText,
        string[] memory suggestedPlants,
        string memory hydroponicSystem,
        uint256 growSpaceNeeded,
        uint256 startupCost,
        uint256 annualIncome,
        string memory productionPlan,
        string memory potentialImpactSummary,
        string memory suggestedLocation,
        uint256 userId,
        uint256 tokens
    ) public hasEnoughTokens(tokens) {
        // Deduct tokens
        tokenTreasury[msg.sender] -= tokens;

        // Add solution
        UrbanFarmSolution memory solution = UrbanFarmSolution(
            zipCode,
            cityName,
            communityName,
            communityType,
            cultureDescription,
            foodSecurityNeeds,
            communityHealthRanking,
            foodDesertPercentage,
            peopleAffectedByF
