# weaversolver

Simple powershell script to solve WordWeaver puzzles.

Usage: ./solver.ps1 -From jury -To duty

Optionally specify the dictionary to use (default is 4 letter words): `./solver.ps1 -From bride -To groom -Dict 5` 

If you update the wordfiles (`english-4letters.txt` or `english-5letters.txt`), re-run `Convert-WordfileToDictionary.ps1`, like this (adjust for the 4 or 5 letter dictionary): `Convert-WordfileToDictionary.ps1 -Dict 4`
