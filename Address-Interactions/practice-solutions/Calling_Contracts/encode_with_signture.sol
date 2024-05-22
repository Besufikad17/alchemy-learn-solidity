// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert(uint enemies, bool armed) external;
}

contract Sidekick {
    function sendAlert(address hero, uint enemies, bool armed) external {
        bytes memory payload = abi.encodeWithSignature("alert(uint256,bool)", enemies, armed);
        
        (bool success, ) = hero.call(payload);

        require(success, "Alert failed");
    }
}
