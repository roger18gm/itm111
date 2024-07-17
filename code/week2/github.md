# Github Setup Instructions

Install GitHub Desktop on the AWS instance.

Open the terminal on the AWS instance and run the following commands:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/kontr0x/github-desktop-install/main/installGitHubDesktop.sh)"
```

Open GitHub Desktop on the AWS instance, and click sign in.

If you don't have a GitHub Account, please create one using your numbered BYU-I email.

Once you've signed in, leave the default settings for the email and click continue.

We want to create a repository on the desktop for all our files that we want to have access to outside the instance or as a backup for your files on your local machine.

Click on the `Create Repository on Local Hard Drive` option and designate the location as the Desktop. The name of this folder should be `itm111` all lowercase. For all files you will receive during this course, make a copy and place it in this folder.

Click the `Create Repository` button.

Now we need to create a repository on GitHub. Click on the `Publish Repository` button.

Name the repository `itm111` and add a description if you'd like. Make sure the repository is private and click the `Publish Repository` button.

We need to create folders to help keep ourselves organized. Open the terminal on the AWS instance and run the following commands one at a time:

```bash
# assuming you put the repo on the desktop
cd /home/student/Desktop/itm111
mkdir code
cd code
mkdir week{2..10}
mkdir final_project
```
Explanation: The `cd` command changes directories. The `mkdir` command creates folders.

Any files you want to have access to outside the instance, copy them to the `itm111` folder on the desktop. Open GitHub Desktop and click on the `Changes` tab. You should see the files you copied to the `itm111` folder.

Add a summary of the changes in the `Summary` box and click the `Commit to main` button.

Click the `Push origin` button to push the files to the GitHub repository.