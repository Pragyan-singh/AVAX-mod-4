// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; import "hardhat/console.sol";
contract DegenToken is ERC20, Ownable, ERC20Burnable { 
constructor() ERC20("Degen", "DGN") {}

    function decimals() override public pure returns (uint8) 
    { 
        return 0;
    }

    function mint(address to, uint256 amount) public onlyOwner 
    { 
        _mint (to, amount); // last value is for decimals
    }

    function burn(address account, uint256 amount) public 
    {
        require (msg.sender == account, "You do not own this account"); 
        _burn(account, amount);
    }

    function getBalance() external view returns (uint256) 
    { 
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address receiver, uint256 _value) public 
    { 
        require (balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens"); 
        approve(msg.sender, _value); 
        transferFrom(msg.sender, receiver, _value);
    }

    // function RedeemItems() public view {
    //     require(balanceOf(msg.sender) <= 10, "(1)You can redeem NFT");
    //     require(balanceOf(msg.sender) <= 50, "(2)You can redeem Shirt");
    //     require(balanceOf(msg.sender) <= 100, "(3)You can redeem Gaming Mouse");
    //     require(balanceOf(msg.sender) <= 200, "(4)You can redeem Gaming Keyboard");
    //     require(balanceOf(msg.sender) <= 500, "(5)You can redeem Gaming Chair");
    //     // Implement redeeming logic here (e.g., in-game items).
    //     // For simplicity, we won't implement it in this example.
    // } 
    function RedeemIteams() public view virtual returns (string memory) {
        return "You can redeem (1)NFT(10) (2)Shirt(50) (3)Gaming Mouse(100) (4)Gaming Keyboard(200) (5)Gaming Chair(500)";
    }


    function RedeemNow(uint256 _value) public 
    {
        require(_value <= 5 || _value>=0, "Invalid Redeem number");
        if (_value==1) {
            require(balanceOf(msg.sender) >= 10, "Insufficient Tokens");
            transferTokens(_owner, 10);
        }
        if (_value==2) {
            require(balanceOf(msg.sender) >= 50, "Insufficient Tokens");
            transferTokens(_owner, 50);
        }
        if (_value==3) {
            require(balanceOf(msg.sender) >= 100, "Insufficient Tokens");
            transferTokens(_owner, 100);
        }
        if (_value==4) {
            require(balanceOf(msg.sender) >= 200, "Insufficient Tokens");
            transferTokens(_owner, 200);
        }
        if (_value==2) {
            require(balanceOf(msg.sender) >= 500, "Insufficient Tokens");
            transferTokens(_owner, 500);
        }
    }
}
