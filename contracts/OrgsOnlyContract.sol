pragma solidity >=0.4.21 <0.7.0;
import "./Organisation.sol";

contract OrgsOnlyContract is Organisation {
    modifier orgsOnly() {
        for (uint256 i = 0; i < totalOrgs; i++) {
            if (orgs[i].ad == msg.sender) {
                _;
            }
        }
    }
}
