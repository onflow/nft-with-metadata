// Pass the repo name
const recipe = "nft-with-metadata";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const nftWithMetdata = {
  slug: recipe,
  title: "NFT with Metadata",
  description: "",
  createdAt: Date(2022, 9, 14),
  author: "Flow Blockchain",
  playgroundLink:
    "https://play.onflow.org/41befd2d-31f3-47f0-ae30-aad776961e31?type=account&id=2a2a417e-5860-419a-b42e-61f540d28a39",
  excerpt:
    "An NFT with metadata in it. This NFT also uses the metadata contract to establish easy views for displaying the NFT's metadata.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};
