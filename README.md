I believe Airbyte redshift normalization is being vastly impacted because of a very specific call to the Redshift SVV_COLUMS table. The problem is in one of Airbyte's custom macros which is responsible to extract the column from the raw JSON string.

The specific issue is, the time Airbyte takes to run a Redshift normalization will depend upon how many columns you have in your model, and I don't think this is healthy.




Let me show you.


Few assumptions:

1. You need to set up your dbt profiles.yml
2. You need to have an intermediate table ie: airbyte staging table with raw data
3. Change the airbyte_model_* files to use your columns


Playing with dbt compile. (dbt run will call dbt compile)

## Run dbt compile for the default examples

```
dbt compile --profiles-dir ./airbyte_dbt/ --project-dir ./airbyte_dbt/ --models my_first_dbt_model my_second_d
bt_model
```

This will not take any time. You can expect it to run in a specific range.

## dbt compile for a "light" Airbyte model. 
### By light a mean - using just a few columns in the model

```
dbt compile --profiles-dir ./airbyte_dbt/ --project-dir ./airbyte_dbt/ --models airbyte_model_light
```

This compilation time can take a few seconds to minutes. The unknown variable here is to expect that the Redshift cluster is in light usage and the calls to SVV_COLUMNS will be fast. Airbyte will do one call for each column in the model.

## dbt compile for a "heavy" model

```
dbt compile --profiles-dir ./airbyte_dbt/ --project-dir ./airbyte_dbt/ --models airbyte_model_heavy
````

The time here will be higher than for the light model.


And finally, the time for the last model will be much higher just because the model has more columns.

