### Nanoplot QC

- Initiate a screen
  ```
  screen -S nano
  ```
- Request a node
    ```
    qlogin -l h_vmem=40G
    ```

- Initiate conda environment with nanoplot installed in it
  ```
  module load anaconda
  conda activate chipseq # I have this env with nanoplot installed
  #mamba install nanoplot ##### uncomment to install nanoplot
  ```

- Run nanoplot
  ```
  . nanoplot.sh
  ```
