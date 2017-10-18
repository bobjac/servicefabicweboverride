
$packagepath = "C:\Users\bobjac\Desktop\GitHub\servicefabricweboverride\src\Application1\Application1\pkg\Debug"

Connect-ServiceFabricCluster -ConnectionEndpoint "localhost:19000"

Copy-ServiceFabricApplicationPackage -ApplicationPackagePath $packagepath -ImageStoreConnectionString "file:C:\SfDevCluster\Data\ImageStoreShare" -ApplicationPackagePathInImageStore "Application1"

Register-ServiceFabricApplicationType -ApplicationPathInImageStore 'Application1'

# Checks the type after it is deploy.  Do this as the portal can shorten the version (e.g. 2.0 instead of 2.0.0).  The version needs to be exact when deploying an instance
Get-ServiceFabricApplicationType

# Deploy two instances and override custom parameters
New-ServiceFabricApplication -ApplicationName 'fabric:/Application1' -ApplicationTypeName 'Application1Type' -ApplicationTypeVersion 2.0.0
New-ServiceFabricApplication -ApplicationName 'fabric:/Application2' -ApplicationTypeName 'Application1Type' -ApplicationTypeVersion 2.0.0 -ApplicationParameter @{Web1_Value1='ChaseUtley'; Web1_Value2='RyanHoward'; Port="8203"}