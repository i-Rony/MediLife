// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
import "./Organ.sol";

contract RequestOrgan is Organ {
    struct Request {
        address requester;
        uint256 organId;
        uint8 age;
        address orgAddress;
        string organName;
        string bloodGroup;
        string contactDetails;
        string name;
        uint64 idProof;
        bool isAccepted;
    }
    Request[] public request;
    uint256 public totalRequest;

    constructor() public {
        totalRequest = 0;
    }

    function acceptRequest(uint256 _id) public orgsOnly {
        require(msg.sender == request[_id].orgAddress);
        request[_id].isAccepted = true;
    }

    function organRequest(
        uint256 _organId,
        string memory _organName,
        string memory _bloodGroup,
        string memory _contactDetails,
        string memory _name,
        uint64 _idProof,
        uint8 _age
    ) public {
        request.push(
            Request(
                msg.sender,
                _organId,
                _age,
                organs[_organId].orgAddress,
                _organName,
                _bloodGroup,
                _contactDetails,
                _name,
                _idProof,
                false
            )
        );
        totalRequest++;
    }

    function orgRequests() public view orgsOnly returns (uint256[] memory) {
        uint256[] memory myRequest;
        uint256 counter = 0;
        for (uint256 i = 0; i < totalRequest; i++) {
            if (request[i].orgAddress == msg.sender) {
                myRequest[counter] = i;
            }
        }
        return myRequest;
    }
}
