// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CreatorRegistry
 * @dev Manages verified creator identities and reputation scores
 */
contract CreatorRegistry {
    struct Creator {
        address walletAddress;
        string name;
        string organization;
        uint256 registrationTime;
        bool isVerified;
        uint256 totalUploads;
        uint256 reputationScore;
    }

    mapping(address => Creator) public creators;
    mapping(address => bool) public isRegistered;
    address public owner;
    uint256 public totalCreators;

    event CreatorRegistered(
        address indexed creatorAddress,
        string name,
        string organization,
        uint256 timestamp
    );

    event CreatorVerified(address indexed creatorAddress, uint256 timestamp);

    event ReputationUpdated(
        address indexed creatorAddress,
        uint256 newScore,
        uint256 timestamp
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyRegistered() {
        require(isRegistered[msg.sender], "Creator not registered");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Register a new creator
     * @param _name Creator's name
     * @param _organization Creator's organization
     */
    function registerCreator(
        string memory _name,
        string memory _organization
    ) external {
        require(!isRegistered[msg.sender], "Creator already registered");
        require(bytes(_name).length > 0, "Name cannot be empty");

        creators[msg.sender] = Creator({
            walletAddress: msg.sender,
            name: _name,
            organization: _organization,
            registrationTime: block.timestamp,
            isVerified: false,
            totalUploads: 0,
            reputationScore: 0
        });

        isRegistered[msg.sender] = true;
        totalCreators++;

        emit CreatorRegistered(
            msg.sender,
            _name,
            _organization,
            block.timestamp
        );
    }

    /**
     * @dev Verify a creator (only owner)
     * @param _creatorAddress Address of the creator to verify
     */
    function verifyCreator(address _creatorAddress) external onlyOwner {
        require(isRegistered[_creatorAddress], "Creator not registered");
        require(!creators[_creatorAddress].isVerified, "Already verified");

        creators[_creatorAddress].isVerified = true;

        emit CreatorVerified(_creatorAddress, block.timestamp);
    }

    /**
     * @dev Increment upload count for a creator
     */
    function incrementUploadCount() external onlyRegistered {
        creators[msg.sender].totalUploads++;
    }

    /**
     * @dev Update reputation score
     * @param _creatorAddress Creator's address
     * @param _score New reputation score
     */
    function updateReputationScore(
        address _creatorAddress,
        uint256 _score
    ) external onlyOwner {
        require(isRegistered[_creatorAddress], "Creator not registered");

        creators[_creatorAddress].reputationScore = _score;

        emit ReputationUpdated(_creatorAddress, _score, block.timestamp);
    }

    /**
     * @dev Get creator information
     * @param _creatorAddress Creator's address
     */
    function getCreator(
        address _creatorAddress
    )
        external
        view
        returns (
            string memory name,
            string memory organization,
            uint256 registrationTime,
            bool verified,
            uint256 uploads,
            uint256 reputation
        )
    {
        require(isRegistered[_creatorAddress], "Creator not registered");

        Creator memory creator = creators[_creatorAddress];
        return (
            creator.name,
            creator.organization,
            creator.registrationTime,
            creator.isVerified,
            creator.totalUploads,
            creator.reputationScore
        );
    }

    /**
     * @dev Check if an address is a verified creator
     * @param _creatorAddress Address to check
     */
    function isVerifiedCreator(
        address _creatorAddress
    ) external view returns (bool) {
        return isRegistered[_creatorAddress] && creators[_creatorAddress].isVerified;
    }
}
