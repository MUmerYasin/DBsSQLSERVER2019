 SELECT COUNT(Product_ID) ,User_Id   FROM [Test][transaction] 
      
     GROUP BY User_Id
	 
     HAVING SUM(spend) > 1000
	 TOP 2
 GO



