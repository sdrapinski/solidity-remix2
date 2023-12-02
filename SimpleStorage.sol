// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint favoriteNumber;

    uint[] listOfNumbers;

    struct Person {
        uint number;
        string name;
    }

    Person[] public listOfPersons;

    mapping(string => uint) public nameToNumber;

    // Person public john = Person({number:1,name:'John1'});
    // Person public john2 = Person({number:2,name:'John2'});
    // Person public john3 = Person({number:3,name:'John3'});

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view prevents editing the state of variables
    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }

    // calldata, memory -> Temporary storage
    // memory can be changed calldata not
    // structs mapping, arrays needs memory keywords
    function addPerson(string memory _name, uint256 _number) public {
        listOfPersons.push(Person(_number, _name));
        nameToNumber[_name] = _number;
    }
}
