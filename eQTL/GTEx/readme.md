### script to merge eQTL-V8 to data.matrix
```
wget https://storage.googleapis.com/gtex_analysis_v8/single_tissue_qtl_data/GTEx_Analysis_v8_eQTL.tar
tar xvf GTEx_Analysis_v8_eQTL.tar
cd GTEx_Analysis_v8_eQTL
gunzip *.gz  
wget https://raw.githubusercontent.com/Shicheng-Guo/AnnotationDatabase/master/eQTL/GTEx/eqtl2matrix.pl
perl eqtl2matrix.pl > eqtl.v8.txt
```

Question:

* rs17632542 showed in GETx website, however not in downloaded V8_eQTL files. Why?
