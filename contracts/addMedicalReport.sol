pragma solidity ^0.5.0;

contract addMedicalReport{
    struct MedicalReport{
        address id;
        string diagnosedWith;
        uint when;
        string testsAndResults;
    }

    mapping(address => MedicalReport[]) MedicalRecords;
    address owner;

    constructor() public{
        owner = 0x3211f38c1d6D62588b0C74fB4AE498f460Ac2E66;
    }

    modifier isCitizen(){
        require(msg.sender == owner);
    }

    event recordAdded(MedicalReport record);

    function addRecord(address _id, string _diagnosedWith, uint _when, string _testsAndResults) public isAdmin{
        record = MedicalReport(_id, _diagnosedWith, _when, _testsAndResults);
        MedicalRecords[_id].push(recor);
        emit recordAdded(record);
        reutrn "Patient Record Added";
    }

}