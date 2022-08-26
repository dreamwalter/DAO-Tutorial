// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Simple721 is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private soldCounter;
    using Strings for uint256;

    string private _baseTokenURI = "https://test.aisw.in/meta/";

    constructor() ERC721("SelcinorhCkrAykS", "SCAS") {
    }

    function mint(address recipient) public payable {
        soldCounter.increment();
        uint256 tokenId = soldCounter.current();
        _safeMint(recipient, tokenId);
    }

    function getCurrentCounter() public view returns (uint) {
        return soldCounter.current();
    }

    // URI
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), 'ERC721Metadata: URI query for nonexistent token');
        return string(abi.encodePacked(_baseURI(), tokenId.toString(), ".json"));
    }

    function baseTokenURI() public view returns (string memory) {
        return _baseURI();
    }

    // setBaseTokenURI
    function setBaseURI(string calldata baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }
}