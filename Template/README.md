# MVVM Custom Template

## Create A Custom File Template
1- Open the Terminal and paste the following line to create a folder named 'Custom' inside Xcode.

`mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/Custom`

2- After that, on Finder press Shift + Command + G again and paste the following:

`~/Library/Developer/Xcode/Templates/Custom`

3- Download the `MVVM File Generator.xctemplate` and paste it into Custom folder

4- The .xctemplate contains two main files WithXIB & WithoutXIB and we can switch between them and that's made with Templateinfo.plist file

4- Open Xcode and command+N into any folder and drag to bottom and you will find there


### Note :- 
In your code if you want to use the File name we use `___BASENAMEFILE___` and if we want to use only name we use `___VARIABLE_productName___`

### Example: if we type Login in the module name so

 `___BASENAMEFILE___` -> LoginViewController 
 
 `___VARIABLE_productName___` -> Login


