pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract addHospital{
    struct Hospital{
        string name;
        address id;
    }

    mapping(address => Hospital) hospitals;
    uint totalHospitals;
    address owner;

    constructor() public{
        totalHospitals = 0;
        owner = 0x3211f38c1d6D62588b0C74fB4AE498f460Ac2E66;
    }

    modifier isAdmin() {
        require(msg.sender == owner);
        _;
    }

    event hospitalAdded(Hospital hospital);

    function addH(string memory _hospitalName, address _id) isAdmin public{
        hospitals[_id] = Hospital(_hospitalName, _id);
        totalHospitals ++;
        emit hospitalAdded(hospitals[_id]);
    }
}