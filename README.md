# Plant_database: What to plant and how to plant
Welcome to the 'Plant_database: What to plant and how to plant' repository!
This is the final project for the course Biological Databases.

The goal is to find out what to plant, and how to plant it by combining different databases depending on the **location (hardiness)**, depending on the **degree of sun exposure**, and depending on the **desired height of the plant**.

Hardiness zone means a geographic area defined to encompass a certain range of climatic conditions relevant to plant growth and survival. So the lower zone number it is or the upper zone number it is, it means extremely colder or hotter, so the fewer suitable plants there are.
_PlantsMaps_ and _Dave’s Garden_ are the source of my databases, and I used python package web crawler such as _beautifulsoup_ and _requests-html_. For the web interface, I used _Shiny_ from Rstudio.

![image](https://github.com/HayoungKim27/Plant_database/blob/main/Images/Reference.png)

## Guideline
All the necessary R scripts are in the Rscript folder (Rscript/).
You can download both R scripts: server.R (Rscript/serverR) and ui.R (Rscript/ui.R).
The required .csv files for running those R scripts are in the data_csv folder (data_csv/).
If you click 'Run App' in R studio, you can see R shiny interface which is the ultimate goal of this project.

## mySQL
### ER diagram
To show my database structure clear, I plot ER diagram using mySQL workbench. I have three datasets, hardiness zone of the _hardiness_belgium table_ is connected to that of _general_edible table_. And general_id of _general_edible table_ is connected to that of _detailed_edible table_.

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/ERdiagram.png" width="70%" height="70%">

**Remark:**

There were some issues here. The primary key and foreign key could be used to connect the columns of each dataset under the plant name, but it was almost impossible to create a primary and foreign key with string. I googled it why, and it seems that there were limitations such as space included in string being transformed to byte as well. So I arbitrarily set an id for the plants that two tables have. And the plants that are not on the general table are removed from the detailed table.

### Used queries
<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/queries.png" width="50%" height="50%">

From these queries, the number of entries in each table can be seen.

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/num_of_entries.png" width="15%" height="15%">

This is the query showing the table hardiness_belgium limited to 10 rows.

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/hardiness_belgium_query.png" width="35%" height="35%">


And this is the result, _hardiness_belgium table_.

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/hardiness_belgium_table.png" width="32%" height="32%">

Same for the table _general_edible table_, and _detail_edible table._

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/general_edible_query.png" width="35%" height="35%">

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/general_edible_table.png" width="80%" height="80%">

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/detail_edibe_query.png" width="35%" height="35%">

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/detail_edibe_table.png">


## Web interface made by R Shiny app
This is the web interface I made by R Shiny after connecting the database from mySQL workbench.

<img src = "https://github.com/HayoungKim27/Plant_database/blob/main/Images/Rshiny.png">

### 1st tab: Which edible fruits or nuts to grow?
There are three steps.

1. From the vast amount of data which is having 146 tabs in total, we can filter by the location with hardiness zone, sun exposure, and the maximum acceptable height.
2. If you don't like any of the filtered plants, you can simply click 'Hide' to get rid of them.
3. You can see the detailed instructions on how you grow them. You can move tabs as well, and maybe sort general ID by clicking on this. In this detailed table, you can get information such as how much water should be given to plants, spacing information, things to keep in mind when growing plants, such as spines or sharp edges, poisonous if ingested, handling plant may cause skin irritation or allergic reaction, and the proper soil pH. As you might know, for example, to make soils less acidic, the common practice is to apply a material that contains some form of lime.
4. Click 'Download Data' to download the table having the detailed information of how to grow them on your local as .csv file. 

Also you can restart from step 1.

### 2nd tab: Summary of the dataset
These are sources of the dataset I used. I also plot a barplot with the y-axis as the number of plants information and the x-axis as hardiness zone. This explains why Brugge with the hardiness zone 9 is filtered more than 8 in gent, since hardiness zone 8 has more information of plants than zone 9. If you think about it, it's natural. Hardiness zone is a geographic area defined to encompass a certain range of climatic conditions relevant to plant growth and survival. So the colder it is or the hotter it is, the fewer suitable plants there are.

## Future work
For the future work, I can add picture of each plant in the last column of the table having general information. I didn't do it yet because of the limited time. And on the web, which has plants information, there were trees, herbs, and so on, so I can pull out more various plants using the web crawler that I have tailored to the website. Web crawlers tailored to the hardiness zone can also be applied to other countries besides Belgium.
