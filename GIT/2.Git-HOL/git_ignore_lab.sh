mkdir GitIgnoreDemo
cd GitIgnoreDemo
git init
echo "This is a debug log file" > debug.log
mkdir log
echo "Log inside folder" > log/app.log
echo "*.log" > .gitignore
echo "log/" >> .gitignore
git status
echo "This is a clean file" > readme.md
git add readme.md .gitignore
git commit -m "Added readme and .gitignore; ignored .log files and log folder"
git status
