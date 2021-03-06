SELECT
    contracts.address,
    contracts.bytecode,
    contracts.function_sighashes,
    contracts.is_erc20,
    contracts.is_erc721,
    TIMESTAMP_SECONDS(blocks.timestamp) AS block_timestamp,
    blocks.number AS block_number,
    blocks.hash AS block_hash
FROM {{DATASET_NAME_RAW}}.contracts AS contracts
    JOIN {{DATASET_NAME_RAW}}.receipts AS receipts ON receipts.contract_address = contracts.address
    JOIN {{DATASET_NAME_RAW}}.blocks AS blocks ON blocks.number = receipts.block_number
