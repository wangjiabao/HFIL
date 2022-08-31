//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract HFILApprove is AccessControlEnumerable {
    using SafeERC20 for IERC20;

    bytes32 public constant SPENDER_ROLE = keccak256("SPENDER_ROLE");

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function ERC20SafeTransferFrom(
        address token,
        address from,
        address to,
        uint256 amount
    ) external onlyRole(SPENDER_ROLE) {
        IERC20(token).safeTransferFrom(from, to, amount);
    }

    function ERC20BurnFrom(
        address token,
        address account,
        uint256 amount
    ) external onlyRole(SPENDER_ROLE) {
        ERC20Burnable(token).burnFrom(account, amount);
    }
}
