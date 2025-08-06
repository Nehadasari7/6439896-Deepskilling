git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
git config --list
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -nosession"
git config --global -e
mkdir GitDemo
cd GitDemo
git init
echo "Welcome to Git Hands-on Lab" > welcome.txt
git status
git add welcome.txt
git commit
git remote add origin https://gitlab.com/your-username/GitDemo.git
git pull origin master
git push origin master
