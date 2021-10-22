# uploadMultiData

This Demo for upload multi values in API using Alamofire
 
i converted Array to object -> Array to dictionary like this

     let dict = Array<[String:Any]>()
     for i in arr {
         dict.append(["userName": i.EmpUserNeme, "age": i.EmpAge , "email": i.EmpEmail])
     }
  
  upload dict to Alamofire
