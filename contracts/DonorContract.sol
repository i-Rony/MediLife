// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

import "./DonorDetails.sol";

contract DonorContract is DonorDetails {
    event NewDonor(address _donor, uint256 _id);

    // event donationStatusUpdateEvent(uint256 _id, bool _donationStatus);

    // event deleteDonorEvent(uint256 _id);

    Donor[] donors;

    function createDonor(
        uint64 _idProof,
        string memory _bloodGroup,
        string memory _name,
        string memory _Address,
        bool _isEyes,
        bool _isKidney,
        bool _isLiver,
        bool _isHeart,
        bool _isLungs
    ) public {
        donors.push(
            Donor({
                donor: msg.sender,
                idProof: _idProof,
                bloodGroup: _bloodGroup,
                name: _name,
                Address: _Address,
                donationStatus: false,
                organ: Organ({
                    isEyes: _isEyes,
                    isKidney: _isKidney,
                    isLiver: _isLiver,
                    isHeart: _isHeart,
                    isLungs: _isLungs
                })
            })
        );

        totalDonors++;

        donorAddressToId[msg.sender] = totalDonors - 1;

        emit NewDonor(msg.sender, totalDonors - 1);
    }

    function deleteDonor(uint256 _id) public {
        require(donorAddressToId[msg.sender] == _id);
        if (totalDonors != 1) {
            delete donors[_id];
            donors[_id] = donors[totalDonors - 1];
            delete donors[totalDonors - 1];
        } else {
            delete donors[_id];
        }
        totalDonors--;

        // emit deleteDonorEvent(_id);
    }

    //only organisation update donation status
    function updateDonationStatus(uint256 _id) internal orgsOnly {
        donors[_id].donationStatus = true;
        // emit donationStatusUpdateEvent(_id, donors[_id].donationStatus);
    }

    function donorDetails(uint256 _id)
        public
        view
        returns (
            address,
            uint64,
            string memory,
            string memory,
            string memory,
            bool,
            bool,
            bool,
            bool,
            bool,
            bool
        )
    {
        Donor memory mydonor = donors[_id];
        Organ memory myorgan = mydonor.organ;
        return (
            mydonor.donor,
            mydonor.idProof,
            mydonor.bloodGroup,
            mydonor.name,
            mydonor.Address,
            mydonor.donationStatus,
            myorgan.isEyes,
            myorgan.isKidney,
            myorgan.isLiver,
            myorgan.isHeart,
            myorgan.isLungs
        );
    }
}
