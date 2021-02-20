pragma solidity >=0.5.0 <0.8.0;
import "./Ownable.sol";

contract Organisation is Ownable {
    struct organisation {
        address ad;
        string name;
        string location;
        string ContactDetails;
    }

    uint256 public totalOrgs;

    organisation[] public orgs;

    function addOrg(
        address _address,
        string memory _name,
        string memory _location,
        string memory _ContactDetails
    ) public onlyOwner returns (bool) {
        orgs.push(organisation(_address, _name, _location, _ContactDetails));
        totalOrgs++;
    }

    function delOrg(uint256 _id) public onlyOwner returns (bool) {
        delete orgs[_id];
        if (totalOrgs != 1) {
            orgs[_id] = orgs[totalOrgs - 1];
            delete orgs[totalOrgs - 1];
        }
        totalOrgs--;
    }

    function updateOrg(
        uint256 _id,
        address _address,
        string memory _name,
        string memory _location,
        string memory _ContactDetails
    ) public onlyOwner returns (bool) {
        orgs[_id] = organisation(_address, _name, _location, _ContactDetails);
    }
}
