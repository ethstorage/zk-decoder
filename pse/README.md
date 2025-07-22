<p align="center">
    <h1 align="center">
        PSE configuration for our circuits
    </h1>
</p>

This configuration is used to apply our route to https://ceremony.pse.dev and provide it to all users participating in the trusted setup ceremony.

**Config fields description**: https://github.com/privacy-scaling-explorations/DefinitelySetup/blob/main/ceremonies/README.md#template-in-details

**Sample config**: https://github.com/privacy-scaling-explorations/DefinitelySetup/blob/main/ceremonies/rln-trusted-setup-ceremony/p0tionConfig.json

**How P0tion work**: https://p0tion.super.site/9110e0b3c8c1404a9598323731974455

**How to contribute**: 

The following are the commands to contribute to the test ceremony
``` bash
sudo npm install -g @stagtion/stagcli
stagcli auth
stagcli contribute -c ethstorage-trusted-setup-ceremony
stagcli clean
stagcli logout
```

The following are the commands to contribute to the product ceremony
``` bash
sudo npm install -g @p0tion/phase2cli
phase2cli auth
phase2cli contribute -c ethstorage-trusted-setup-ceremony
phase2cli clean
phase2cli logout
``` 


### circom compile params
- cargo 1.88.0 (873a06493 2025-05-10)
- rustc 1.88.0 (6b00bc388 2025-06-23)
- circom compiler 2.2.2 (e410b0d5cd2948a15931df0bc50d79ce56fa8c32)
