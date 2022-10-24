{{ config(
    sort = "_airbyte_emitted_at",
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_airbyte",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('airbyte', '_airbyte_raw_carriers_carrier_mini_dev') }}
select
    1
    {{ json_extract_scalar('_airbyte_data', ['ff'], ['ff']) }} as ff,
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['mc'], ['mc']) }} as mc,
    {{ json_extract_scalar('_airbyte_data', ['mx'], ['mx']) }} as mx,
    {{ json_extract_scalar('_airbyte_data', ['dot'], ['dot']) }} as dot,
    {{ json_extract_scalar('_airbyte_data', ['scac'], ['scac']) }} as scac,
    {{ json_extract_scalar('_airbyte_data', ['ff'], ['ff']) }} as ff,
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['mc'], ['mc']) }} as mc,
    {{ json_extract_scalar('_airbyte_data', ['mx'], ['mx']) }} as mx,
    {{ json_extract_scalar('_airbyte_data', ['dot'], ['dot']) }} as dot,
    {{ json_extract_scalar('_airbyte_data', ['scac'], ['scac']) }} as scac,
    {{ json_extract_scalar('_airbyte_data', ['ff'], ['ff']) }} as ff,
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['mc'], ['mc']) }} as mc,
    {{ json_extract_scalar('_airbyte_data', ['mx'], ['mx']) }} as mx,
    {{ json_extract_scalar('_airbyte_data', ['dot'], ['dot']) }} as dot,
    {{ json_extract_scalar('_airbyte_data', ['scac'], ['scac']) }} as scac,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('airbyte', '_airbyte_raw_carriers_carrier_mini_dev') }} as table_alias
-- carriers_carrier_mini_dev
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}
