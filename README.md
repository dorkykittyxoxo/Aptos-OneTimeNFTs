OneTimeNFT Module

Overview

The OneTimeNFT module defines a simple one-time use NFT (Non-Fungible Token) on the Aptos blockchain. This NFT can be minted and used only once, after which it is consumed.

Features

Minting a one-time use NFT

Ensuring the NFT can only be used once

Removing the NFT from the owner's account after use

Module Structure

The module contains the following key components:

Structs

AccessNFT: A struct representing the NFT with a boolean field used to track whether it has been utilized.

Functions

mint_nft(recipient: &signer)

Mints a new NFT and assigns it to the recipient.

The NFT starts with used: false, indicating it has not been used.

use_nft(owner: &signer) acquires AccessNFT

Allows the owner to use the NFT.

Checks if the NFT has already been used.

If unused, sets used: true and removes the NFT from the owner's account.

Usage

Minting an NFT

To mint an NFT, call:

MyModule::OneTimeNFT::mint_nft(&recipient);

Using the NFT

To use the NFT, call:

MyModule::OneTimeNFT::use_nft(&owner);

If the NFT has already been used, the function will assert an error.

Important Notes

An NFT is permanently removed from the owner's account upon usage.

The assert! function ensures that an NFT cannot be used more than once.

License

This module is open-source and can be modified and distributed freely.

Authors

Developed by the OneTimeNFT team.

Contact Address

0xf423780a95af9ef8326a39ac45509294b9a99448f6e000aec0900b905f0f0746
