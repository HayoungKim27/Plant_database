# Plant_database: What to plant and how to plant
Welcome to the 'Plant_database: What to plant and how to plant' repository!
This is the final project for the course Biological Databases.

The goal is to find out what to plant, and how to plant it by combining different databases depending on the **location (hardiness)**, depending on the **degree of sun exposure**, and depending on the **desired height of the plant**.

Hardiness zone means a geographic area defined to encompass a certain range of climatic conditions relevant to plant growth and survival. So the lower zone number it is or the upper zone number it is, it means extremely colder or hotter, so the fewer suitable plants there are.
_PlantsMaps_ and _Dave’s Garden_ are the source of my databases, and I used python package web crawler such as _beautifulsoup_ and _requests-html_. For the web interface, I used _Shiny_ from Rstudio.

![image](https://github.com/HayoungKim27/Plant_database/blob/main/Images/Reference.png)

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

There are three steps.



## Guideline
All the necessary R scripts are in the Rscript folder (Rscript/).
You can download both R scripts: server.R (Rscript/serverR) and ui.R (Rscript/ui.R).
