# Virtual Machine

These resources are used to set up and manage an Debian Virtual Machine on Google Compute Engine.

> The following permissions are needed (non-owner users) for SSH remote connection: **Compute Instance Admin (V1)**, **IAP-secured Tunnel User**. These permissions can be set under IAM.

The VM is set up following this [GCP guide](https://cloud.google.com/architecture/building-internet-connectivity-for-private-vms):

* Creating a VM instance
* Configuring an IAP tunnel for interaction with instances
* Create a Cloud NAT instance for outbound connections to the internet

---

## Terraform resources

The following [resources](main.tf) are deployed:

* `google_compute_network` - Default network for VM instance
* `google_compute_firewall` - IAP firewall rule
* `google_compute_disk` - Persistend disk for VM
* `google_compute_instance` - VM instance
* `google_compute_router` - NAT router for region
* `google_compute_router_nat` - NAT configuration for region
