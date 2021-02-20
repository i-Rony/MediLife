// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
import "./OrgsOnlyContract.sol";

contract DonorDetails is OrgsOnlyContract {
    struct Organ {
        bool isEyes;
        bool isKidney;
        bool isLiver;
        bool isHeart;
        bool isLungs;
    }

    struct Donor {
        address donor;
        uint64 idProof;
        string bloodGroup;
        string name;
        string Address;
        bool donationStatus;
        Organ organ;
    }

    uint256 public totalDonors;

    mapping(address => uint256) public donorAddressToId;

    constructor() public {
        totalDonors = 0;
    }
}
