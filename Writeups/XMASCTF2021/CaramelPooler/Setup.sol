// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CaramelPool.sol";

/** 
  @title Setup for CaramelPool
  @author bobi @ X-MASCTF2021
 */
contract Setup {
    CaramelPool public caramelPool;

    constructor() { 
        
        address[] memory _depositors = new address[](10);
        // _depositors[0] = "missing_address";
        // _depositors[1] = "missing_address";
        // _depositors[2] = "missing_address";
        // _depositors[3] = "missing_address";
        // _depositors[4] = "missing_address";
        // _depositors[5] = "missing_address";
        // _depositors[6] = "missing_address";
        // _depositors[7] = "missing_address";
        // _depositors[8] = "missing_address";
        // _depositors[9] = "missing_address";

        caramelPool = new CaramelPool(_depositors);
    }

    function isSolved() public view returns (bool) {
        return (address(caramelPool.caramelShogun()) != 0x0000000000000000000000000000000000000013);
    }

}