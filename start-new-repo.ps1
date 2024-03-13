param(
    [string]$dirName,
    [string]$newRepoUrl
)

# Ensure both directory name and new repository URL are passed
if (-not $dirName -or -not $newRepoUrl) {
    Write-Host "Error: Missing arguments." -ForegroundColor Red
    Write-Host "Example Usage: .\start-new-repo.ps1 'directoryName' 'git@github.com:username/new-repo.git'" -ForegroundColor Yellow
    Write-Host "The Example Usage uses a github URL, but it can be any git URL" -ForegroundColor Yellow
    cd ..
    exit 1
}

# Change to the specified directory
cd $dirName

git init
git add .
git commit -m "First Commit"
git branch -M main
git remote add origin $newRepoUrl
git push -u origin main


Write-Host "Successfully pushed to $newRepoUrl from directory $dirName" -ForegroundColor Green

cd ..
