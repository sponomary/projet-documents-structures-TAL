----------------------------------------------------------------------
## Ex.15, partie XSLT, question 1
----------------------------------------------------------------------
xsltproc ex15-p1-q1.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q1.txt      

----------------------------------------------------------------------
## Ex.15, partie XSLT, question 2
----------------------------------------------------------------------
xsltproc ex15-p1-q2.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q2.html      

----------------------------------------------------------------------
## Ex.15, partie XSLT, question 3
----------------------------------------------------------------------   
xsltproc ex15-p1-q3.xsl baseTrameurFromRhapsodie.xml > ex15-p1-q3.txt   

----------------------------------------------------------------------
## Ex.15, partie XSLT, question 4
----------------------------------------------------------------------   
xsltproc ex15-p1-q4.xsl baseTrameurFromRhapsodie.xml | sort | uniq -c | sort -gr > ex15-p1-q4.txt

----------------------------------------------------------------------
## Ex.15, partie XSLT, question 5
----------------------------------------------------------------------   
xsltproc ex15-p1-q5.xsl baseTrameurFromRhapsodie.xml | sort | uniq -c | sort -gr > ex15-p1-q5.txt