# Download data from the PDB

The purpose of this project is to provide an alternative to *rsync* to download data from the PDB https://files.wwpdb.org/pub/pdb/data/structures/divided/mmCIF after I had a problem with my university firewall to download the mmCIF database to run AlphaFold locally. Nevertheless, it should work to download other type of data from this same source.

## Before you start

### Prerequisites

* Basic knowledge of Unix/Linux Shell commands

### Usage

1. Clone repository.
```sh
git clone git@github.com:benjaminlozanow/pdb_data_download.git
```

2. Run [download_pdb.sh](https://github.com/benjaminlozanow/pdb_data_download/blob/main/download_pdb.sh) in the desired directory.
```sh
chmod +x download_pdb.sh
```

```sh
./download_pdb.sh "https://files.wwpdb.org/pub/pdb/data/structures/divided/mmCIF"
```  

3. You will have generated new files, specially *list.txt*, where URLs are stored (an outdated version of this files is provided for you to try).  

*You can run this script to only generate the list of URLs or to just download the data comming from those links. In order to do so you just need to comment some lines from the code.*

4. After the data is downloaded (it could take a while depending on the type of data), run the [unzip_flatten.sh](https://github.com/benjaminlozanow/pdb_data_download/blob/main/unzip_flatten.sh) with absolute path of the downloaded directory as argument.  
```sh
chmod +x unzip_flatten.sh
```

```sh
./unzip_flatten.sh ~/path_to_data_directory
```  

## The Error I got

While executing the [download_pdb_mmcif.sh](https://github.com/deepmind/alphafold/blob/main/scripts/download_pdb_mmcif.sh) I recieved the following error:

> rsync: failed to connect to rsync.rcsb.org (128.6.158.70): Connection timed out (110)  
rsync error: error in socket IO (code 10) at clientserver.c(127) [Receiver=3.1.3]


## Contribution

Feel free to optimize/modify the code to have better or different results.
