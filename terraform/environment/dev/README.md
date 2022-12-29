# GCP resources

These `.tf` files will create GCP related resources.

## Create/Update infrastructure

If you make changes to infrastructure, the following steps should be applied:

```bash
terraform init
```

This will initialize `modules`, `backend`, and `provider plugins`.

Next step is to apply the infrastructure:

```bash
terraform apply
```

You will get an output of the planned changes that will happen. You will be prompted with writing `yes` in order for the changes to be applied.

## Modules

The following modules are deployed:

* `virtual_machine`  
    This module will create and deploy a virtual machine (VM) on GCE. See [VM README](../../modules/virtual_machine/README.md) for reference.
