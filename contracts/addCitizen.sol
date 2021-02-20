pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract addCitizen{
    struct Citizen{
        string name;
        uint phone;
        uint adhar;
        address id;
    }

    mapping(address => Citizen) citizens;
    uint totalCitizens;
    address owner;

    constructor() public{
        totalCitizens = 0;
        owner = 0x3211f38c1d6D62588b0C74fB4AE498f460Ac2E66;
    }

    modifier isAdmin(){
        require(msg.sender == owner);
        _;
    }

    event citizenAdded(Citizen citizen);

    function addC(string memory _name, uint _phone, uint _adhar, address _id) isAdmin public {
        citizens[_id] = Citizen(_name, _phone, _adhar, _id);
        totalCitizens ++;
        emit citizenAdded(citizens[_id]);
    }
}