// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public ListOfSimpleStorage;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();

        ListOfSimpleStorage.push(newSimpleStorage);
    }

    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        //Address
        //ABI - Application Bianary interface

        SimpleStorage mysimpleStorage = ListOfSimpleStorage[
            _simpleStorageIndex
        ];
        mysimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage mySimpleStorage = ListOfSimpleStorage[
            _simpleStorageIndex
        ];
        return mySimpleStorage.retrive();
    }
}
