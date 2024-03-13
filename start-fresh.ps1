param(
    [string]$dirName,
    [string]$newRepoUrl
)

# Ensure both directory name and new repository URL are passed
if (-not $dirName -or -not $newRepoUrl) {
    Write-Host "Error: Missing arguments." -ForegroundColor Red
    Write-Host "Example Usage: .\start-fresh.ps1 'directoryName' 'git@github.com:username/new-repo.git'" -ForegroundColor Yellow
    Write-Host "The Example Usage uses a github URL, but it can be any git URL" -ForegroundColor Yellow
    cd ..
    exit 1
}

# Change to the specified directory
cd $dirName

# Checkout to a new orphan branch named 'main'
git checkout --orphan main

# Add all files to the staging area
git add .

# Commit changes with a message
git commit -m "First commit"

# Add new remote for the new repository
git remote add reorigin $newRepoUrl

# Force push to the 'main' branch of the new repository
git push --force reorigin main

Write-Host "Successfully pushed to $newRepoUrl from directory $dirName" -ForegroundColor Green

cd ..
