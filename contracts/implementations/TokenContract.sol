pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "../interfaces/IERC20Custom.sol";

contract CustomToken is ERC20, Ownable, IERC20Custom {
    mapping(address => bool) public whitelisted;
    uint256 public maxSupply;

    constructor(uint256 _maxSupply) ERC20("Custom Token", "CTK") {
        maxSupply = _maxSupply;
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function mint(address to, uint256 amount) public override onlyOwner {
        require(totalSupply() + amount <= maxSupply, "Exceeds max supply");
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(address from, uint256 amount) public override {
        require(msg.sender == from || whitelisted[msg.sender], "Not authorized");
        _burn(from, amount);
        emit TokensBurned(from, amount);
    }

    function transferWithCallback(address to, uint256 amount) public override returns (bool) {
        bool success = transfer(to, amount);
        if (success) {
            // Additional callback logic here
        }
        return success;
    }

    function addToWhitelist(address account) public onlyOwner {
        whitelisted[account] = true;
    }

    function removeFromWhitelist(address account) public onlyOwner {
        whitelisted[account] = false;
    }
}