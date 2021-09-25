pragma solidity >=0.6.6;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleCollectible is ERC721URIStorage {
    uint256 public tokenCounter;

    mapping(address => uint256[]) private _collectibles;

    constructor() ERC721("Sword Art Online", "SAO") {
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _addCollectibles(msg.sender, newItemId);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

    function getCollectibles(address id) external view returns (uint256[] memory) {
        return _collectibles[id];
    }

    function _addCollectibles(address id, uint256 tokenID) private {
        _collectibles[id].push(tokenID);
    }
}
