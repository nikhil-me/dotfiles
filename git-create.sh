#Function to turn the current directory into a new GitHub repository
github-create () {
    currentDir=${PWD##*/}
    currentDir=${currentDir// /_}
    userName=$1

    curl -u $userName https://api.github.com/user/repos -d '{"name":"'$currentDir'"}' &&
    echo "# "$currentDir >> README.md &&
    git init &&
    git add -A . &&
    git commit -m "first commit" &&
    git remote add origin https://github.com/$userName/$currentDir.git &&
    git push -u origin master
}
#save this fucntion in .bashrc
#source ~/.bashrc

#go to that directory
#type the below given command
# github-create <YOUR GITHUB USERNAME>
