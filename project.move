module MyModule::OneTimeNFT {

    use aptos_framework::signer;

    /// Struct representing a one-time use NFT
    struct AccessNFT has key, store {
        used: bool,  // Indicates whether the NFT has been used
    }

    /// Function to mint a one-time use NFT
    public fun mint_nft(recipient: &signer) {
        let nft = AccessNFT { used: false };
        move_to(recipient, nft);
    }

    /// Function to use the NFT, consuming it after one-time access
    public fun use_nft(owner: &signer) acquires AccessNFT {
        let nft = borrow_global_mut<AccessNFT>(signer::address_of(owner));
        assert!(!nft.used, 1);  // Ensure NFT has not been used before
        nft.used = true;
        move_from<AccessNFT>(signer::address_of(owner)); // Remove NFT after use
    }
}