#Outputting to Different File Formats
Quarto is designed so that a single file can output to different file formats. These formats include HTML, PDF, Word, PowerPoint, Epub, and others. This is useful as it is often neccessary that the same content will be displayed in different mediums based on the audience. For example, assuming both stakeholders and audit get the same report, one may require a powerpoint and the other a pdf. Instead of maintaining separate processes or files we can instead maintain a single Quarto file and output to both formats.

Changing the output format of a Quarto file can be done manually using in the YAML header. My preferred method is by using shell script, which has the added benefit of executing the Quarto file in addition to altering the output format. This can be easily done with the following shell script:
```
#! /bin/sh
cd "$(dirname "$0")"

params=("html" "pdf")

for n in "${params[@]}";
do
    quarto render /File Path/file.qmd --to "$n" 
done
```
First we set the working directory equal to the directory containing the shell script, which should be the same directory as your Quarto file. Next we set the desired output formats as parameters. Lastly we provide the file path to our Quarto file and we are good to go.

That easily we can output our Quarto file to different formats. One thing to be aware of is how the structure of your Quarto file will translate to different formats. Quarto uses things like headers to make determinations in different formats such as where a PowerPoint slide begins. In the rare cases where the translation between formats is causing issues I suggest the following remedies:
* Try re-structuring your file so it cleanly fits both formats
* Use conditional content to only show content that makes sense for each out put format
* Create a Quarto project with multiple Quarto files. Projects allow for content to be easily shared between Quarto files as well as all files to be rendered with a single command.

Hopefully this was helpful. Feel free to reach out on twitter (@soloemoon) with any questions.
