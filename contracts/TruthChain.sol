// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./CreatorRegistry.sol";

/**
 * @title TruthChain
 * @dev Main contract for content verification and version tracking
 */
contract TruthChain {
    struct ContentRecord {
        bytes32 contentHash;
        address creator;
        string ipfsMetadataHash;
        uint256 timestamp;
        uint256 versionNumber;
        bytes32 previousVersionHash;
        bool exists;
    }

    struct ContentVersion {
        bytes32 contentHash;
        uint256 timestamp;
        string ipfsMetadataHash;
    }

    CreatorRegistry public creatorRegistry;

    // Mapping from content hash to content record
    mapping(bytes32 => ContentRecord) public contentRecords;

    // Mapping from content ID to all versions
    mapping(bytes32 => ContentVersion[]) public contentVersions;

    // Mapping from content hash to content ID (for version tracking)
    mapping(bytes32 => bytes32) public hashToContentId;

    // Total number of unique content pieces
    uint256 public totalContent;

    // Total verifications performed
    uint256 public totalVerifications;

    event ContentRegistered(
        bytes32 indexed contentHash,
        bytes32 indexed contentId,
        address indexed creator,
        string ipfsMetadataHash,
        uint256 timestamp,
        uint256 versionNumber
    );

    event ContentVerified(
        bytes32 indexed contentHash,
        address indexed verifier,
        bool isAuthentic,
        uint256 timestamp
    );

    event ContentUpdated(
        bytes32 indexed oldHash,
        bytes32 indexed newHash,
        bytes32 indexed contentId,
        address creator,
        uint256 versionNumber,
        uint256 timestamp
    );

    modifier onlyVerifiedCreator() {
        require(
            creatorRegistry.isVerifiedCreator(msg.sender),
            "Only verified creators can register content"
        );
        _;
    }

    constructor(address _creatorRegistryAddress) {
        creatorRegistry = CreatorRegistry(_creatorRegistryAddress);
    }

    /**
     * @dev Register new content on the blockchain
     * @param _contentHash SHA-256 hash of the content
     * @param _ipfsMetadataHash IPFS hash containing metadata
     */
    function registerContent(
        bytes32 _contentHash,
        string memory _ipfsMetadataHash
    ) external onlyVerifiedCreator returns (bytes32) {
        require(_contentHash != bytes32(0), "Invalid content hash");
        require(!contentRecords[_contentHash].exists, "Content already registered");
        require(bytes(_ipfsMetadataHash).length > 0, "IPFS hash required");

        // Generate unique content ID (first version uses content hash as ID)
        bytes32 contentId = _contentHash;

        // Create content record
        contentRecords[_contentHash] = ContentRecord({
            contentHash: _contentHash,
            creator: msg.sender,
            ipfsMetadataHash: _ipfsMetadataHash,
            timestamp: block.timestamp,
            versionNumber: 1,
            previousVersionHash: bytes32(0),
            exists: true
        });

        // Add to version history
        contentVersions[contentId].push(
            ContentVersion({
                contentHash: _contentHash,
                timestamp: block.timestamp,
                ipfsMetadataHash: _ipfsMetadataHash
            })
        );

        // Map hash to content ID
        hashToContentId[_contentHash] = contentId;

        totalContent++;

        // Increment creator's upload count
        creatorRegistry.incrementUploadCount();

        emit ContentRegistered(
            _contentHash,
            contentId,
            msg.sender,
            _ipfsMetadataHash,
            block.timestamp,
            1
        );

        return contentId;
    }

    /**
     * @dev Register an updated version of existing content
     * @param _newContentHash Hash of the new version
     * @param _previousContentHash Hash of the previous version
     * @param _ipfsMetadataHash IPFS hash containing metadata
     */
    function registerContentUpdate(
        bytes32 _newContentHash,
        bytes32 _previousContentHash,
        string memory _ipfsMetadataHash
    ) external onlyVerifiedCreator returns (bytes32) {
        require(_newContentHash != bytes32(0), "Invalid content hash");
        require(!contentRecords[_newContentHash].exists, "New version already registered");
        require(contentRecords[_previousContentHash].exists, "Previous version not found");
        require(
            contentRecords[_previousContentHash].creator == msg.sender,
            "Only original creator can update"
        );

        // Get content ID from previous version
        bytes32 contentId = hashToContentId[_previousContentHash];
        uint256 newVersionNumber = contentRecords[_previousContentHash].versionNumber + 1;

        // Create new content record
        contentRecords[_newContentHash] = ContentRecord({
            contentHash: _newContentHash,
            creator: msg.sender,
            ipfsMetadataHash: _ipfsMetadataHash,
            timestamp: block.timestamp,
            versionNumber: newVersionNumber,
            previousVersionHash: _previousContentHash,
            exists: true
        });

        // Add to version history
        contentVersions[contentId].push(
            ContentVersion({
                contentHash: _newContentHash,
                timestamp: block.timestamp,
                ipfsMetadataHash: _ipfsMetadataHash
            })
        );

        // Map new hash to same content ID
        hashToContentId[_newContentHash] = contentId;

        // Increment creator's upload count
        creatorRegistry.incrementUploadCount();

        emit ContentUpdated(
            _previousContentHash,
            _newContentHash,
            contentId,
            msg.sender,
            newVersionNumber,
            block.timestamp
        );

        return contentId;
    }

    /**
     * @dev Verify if content exists and is authentic
     * @param _contentHash Hash to verify
     */
    function verifyContent(
        bytes32 _contentHash
    )
        external
        returns (
            bool exists,
            address creator,
            uint256 timestamp,
            string memory ipfsHash,
            uint256 versionNumber
        )
    {
        totalVerifications++;

        bool isAuthentic = contentRecords[_contentHash].exists;

        emit ContentVerified(
            _contentHash,
            msg.sender,
            isAuthentic,
            block.timestamp
        );

        if (isAuthentic) {
            ContentRecord memory record = contentRecords[_contentHash];
            return (
                true,
                record.creator,
                record.timestamp,
                record.ipfsMetadataHash,
                record.versionNumber
            );
        }

        return (false, address(0), 0, "", 0);
    }

    /**
     * @dev Get all versions of a content piece
     * @param _contentId Content ID (hash of first version)
     */
    function getContentVersions(
        bytes32 _contentId
    ) external view returns (ContentVersion[] memory) {
        return contentVersions[_contentId];
    }

    /**
     * @dev Get content record details
     * @param _contentHash Hash of the content
     */
    function getContentRecord(
        bytes32 _contentHash
    )
        external
        view
        returns (
            address creator,
            string memory ipfsHash,
            uint256 timestamp,
            uint256 versionNumber,
            bytes32 previousHash,
            bool exists
        )
    {
        ContentRecord memory record = contentRecords[_contentHash];
        return (
            record.creator,
            record.ipfsMetadataHash,
            record.timestamp,
            record.versionNumber,
            record.previousVersionHash,
            record.exists
        );
    }

    /**
     * @dev Get content ID from any version hash
     * @param _contentHash Hash of any version
     */
    function getContentId(bytes32 _contentHash) external view returns (bytes32) {
        return hashToContentId[_contentHash];
    }

    /**
     * @dev Get version count for a content piece
     * @param _contentId Content ID
     */
    function getVersionCount(bytes32 _contentId) external view returns (uint256) {
        return contentVersions[_contentId].length;
    }
}
