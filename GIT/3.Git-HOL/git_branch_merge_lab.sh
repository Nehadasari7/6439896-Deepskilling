cd GitDemo  
git branch GitNewBranch
git branch
git checkout GitNewBranch
echo "This file is in the GitNewBranch" > branch_file.txt
git add branch_file.txt
git commit -m "Added branch_file.txt in GitNewBranch"
git status
git diff master..GitNewBranch
git merge GitNewBranch
git log --oneline --graph --decorate
git branch -d GitNewBranch
git status
