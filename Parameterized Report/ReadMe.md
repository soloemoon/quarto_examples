# Parameterized Reports Quick Explainer
Report parameterization is useful when the need arises to report a defined set of metrics for different groups. Using parameters, we can maintain a single Quarto file capable of outputting our various reports, reducing overhead and enhancing efficiency. 

We start by defining our variables in our Quarto file. Create a code chunk containg the variables(s) needed with the special comment `#| tags: parameters`. Any created parameters must be given a default value.
```
#| tags: [parameters]
param1 = 'default value here'
```
The defined parameter(s) should be used in any code chunks where a dynamic change is needed. For example, if `param1` will be used to filter a sql query, we might have a code chunk that looks like this:
```
query = 'select * from query_table where business_unit = {}'.format(param1)
df = pd.read_sql_query(query)
```
Once the Quarto file is complete we then add in the other parameters that will be iterated over. These parameters can be added through YAML file or my prefererd way of using a shell script. The benefit of a shell script is it also enables the automation of report generation in addition to changing the Quarto parameter(s).

Our shell script will look something like this:
```
#! /bin/sh
cd "$(dirname "$0")"

params=("default value here" "next value here" "another value here")

for n in "${params[@]}";
do
    quarto render /File Path/file.qmd --output "$n.pdf" -P param1:"$n" 
done

```
the first line sets the directory of the shell script as the current directory (this should be in the same directory as Quarto file). All parameters, including the default value, are entered into the params section. The code then iterates over each param and outputs a file, in this case pdf, for each parameter. I have set up this shell script up to name each output PDF after the parameter it is based on so we don't overwrite previous files.

Creating a parameterized report in Quarto is that easy! See the qmd for a working example and feel free to reach out to me on twitter (@soloemoon) with any questions. 

Hope you found this helpful!
