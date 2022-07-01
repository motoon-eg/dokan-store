# MVVM Custom Template

## Create A Custom File Template
1- Open the Terminal and paste the following line to create a folder named 'Custom' inside Xcode.

`mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/Custom`

2- Next, open Finder, press Shift +Command + G and paste the following path:

`/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates`

3- Then, go to Source and copy the folder Package Swift File.xctemplate somewhere on your Desktop

4- After that, on Finder press Shift + Command + G again and paste the following:

`~/Library/Developer/Xcode/Templates`


5- Inside the Custom folder, paste the Package Swift File.xctemplate you copied before on your Desktop. and if you want template to storyboard file go to Storyboard and copy the .storyboard , xib copy the .xib template file.


### Note :- 
In your code if you want to use the File name we use `___BASENAMEFILE___` and if we want to use only name we use `___VARIABLE_productName___`

### Example: if we type Login in the module name so

 `___BASENAMEFILE___` -> LoginViewController 
 
 `___VARIABLE_productName___` -> Login


