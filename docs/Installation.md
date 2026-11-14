Prerequisites:
- ModelicaStandardLibrary v4.1.0 (https://github.com/modelica/ModelicaStandardLibrary)

clone the repository above as well as this repository if you haven't already. Cloning the repositories will make it easier for you to get updates when available. We also recommend watching this repo so you can be informed of relevant updates such as new releases. 

The startup script below can be used to simiplify loading of all the libraries

Common start up script
```
// clear everything 
clear();

// Set path
mdchome = "<Path to folder containing dymola related libraries>";
mdcwork = mdchome + "WorkingDir/";
mdcscripts = mdchome + "Scripts/";

// Load Packages
  // MSL
openModelFile("Modelica", mdchome + "ModelicaStandardLibrary/Modelica/package.mo");
openModelFile("Complex", mdchome + "ModelicaStandardLibrary/Complex.mo");
openModelFile("ModelicaServices", mdchome + "ModelicaStandardLibrary/ModelicaServices/package.mo");
  // OpenTEMPEST
openModelFile("OpenTEMPEST", mdchome + "OpenTEMPEST/package.mo");

// go to working directory
cd(mdcwork);

// close document window
switchLayer(3, false);

```


NOTE: The cloned MSL is pretty bare bones and may be missing some features, especially for dymola. One that we have noticed is the loadresource being used in ``Modelica.Utilities.Files.loadResource``, replace in ModelicaServices/package.mo package ExternalReferences the line containing 
```
algorithm
fileReference := Modelica.Utilities.Files.fullPathName(uri);
```
with 
```
external "builtin" fileReference=Dymola_ResolveURI(uri);
```


[Return to main page](../README.md)