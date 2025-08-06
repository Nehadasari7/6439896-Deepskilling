cd GitDemo 
git checkout master
git status
git checkout -b GitWork
echo "<message>Hello from GitWork branch</message>" > hello.xml
git add hello.xml
git commit -m "Added hello.xml in GitWork branch"
git checkout master
echo "<note>Hello from master branch</note>" > hello.xml
git add hello.xml
git commit -m "Added conflicting hello.xml in master branch"
git log --oneline --graph --decorate --all
git diff GitWork
git merge GitWork
git add hello.xml
git commit -m "Resolved merge conflict in hello.xml"
echo "*.*~" >> .gitignore
git add .gitignore
git commit -m "Added backup file pattern to .gitignore"
git branch
git branch -d GitWork
git log --oneline --graph --decorate
