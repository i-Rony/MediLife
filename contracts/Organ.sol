pragma solidity >=0.5.0 <0.8.0;
import "./DonorContract.sol";

contract Organ is DonorContract {
    struct organ {
        uint256 donorId;
        address orgAddress;
        bool donationStatus;
        string organName;
    }

    organ[] public organs;

    uint256 public Eyes;
    uint256 public Kidney;
    uint256 public Liver;
    uint256 public Heart;
    uint256 public Lung;

    uint256 public totalOrgans;

    constructor() public {
        totalOrgans = 0;
        Eyes = 0;
        Kidney = 0;
        Liver = 0;
        Heart = 0;
        Lung = 0;
    }

    function deceased(uint256 _id) public orgsOnly {
        updateDonationStatus(_id);
        bool eyes;
        bool kidney;
        bool liver;
        bool heart;
        bool lung;
        (, , , , , , eyes, kidney, liver, heart, lung) = donorDetails(_id);
        if (eyes) {
            organs.push(organ(_id, msg.sender, false, "Eye"));
            totalOrgans++;
            Eyes++;
        }
        if (kidney) {
            organs.push(organ(_id, msg.sender, false, "Kidney"));
            totalOrgans++;
            Kidney++;
        }
        if (liver) {
            organs.push(organ(_id, msg.sender, false, "Liver"));
            totalOrgans++;
            Liver++;
        }
        if (heart) {
            organs.push(organ(_id, msg.sender, false, "Heart"));
            totalOrgans++;
            Heart++;
        }
        if (lung) {
            organs.push(organ(_id, msg.sender, false, "Lung"));
            totalOrgans++;
            Lung++;
        }
    }
}
