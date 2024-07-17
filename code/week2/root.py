import mysql.connector
import os
import platform
import subprocess

# connect to root user
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="C4nGet1n!",
)

# print(mydb)


# execute the root commands to grant access to the new user
directory = os.getcwd()
# check to see what system I'm using
name = platform.system()
if name == 'Linux':
    filename = f"/home/student/Desktop/clarkstudents24/code/week2/root.sql"
    run_git = input("Would you like to run the github desktop script? (y/n): ")
    if run_git == 'y':
        subprocess.run(["bash", f"/home/student/Desktop/clarkstudents24/code/week2/github.sh"])
    else:
        print("Skipping github desktop script")
    run_file = input("Would you like to run the file setup script? (y/n): ")
    if run_file == 'y':
        print("Running file setup...")
        subprocess.run(["bash", f"/home/student/Desktop/clarkstudents24/code/week2/file_setup.sh"])
    else:
        print("Skipping file setup script")

elif name == 'Darwin':
    filename = f"{directory}/root.sql"
    run_git = input("Would you like to run the github desktop script? (y/n): ")
    if run_git == 'y':
        subprocess.run(["bash", f"{directory}/github.sh"])
    else:
        print("Skipping github desktop script")
    run_file = input("Would you like to run the file setup script? (y/n): ")
    if run_file == 'y':
        subprocess.run(["bash", f"{directory}/file_setup.sh"])
    else:
        print("Skipping file setup script")

elif name == 'Windows':
    filename = f"{directory}\\root.sql"
    run_git = input("Would you like to run the github desktop script? (y/n): ")
    if run_git == 'y':
        subprocess.run(["powershell", f"{directory}\\github.ps1"])
    else:
        print("Skipping github desktop script")
    run_file = input("Would you like to run the file setup script? (y/n): ")
    if run_file == 'y':
        subprocess.run(["powershell", f"{directory}\\file_setup.ps1"])
    else:
        print("Skipping file setup script")

with open(filename, 'r+') as file:
    sqlFile = file.read()
    commands = sqlFile.split('-- ~')
    commands = [command.strip() for command in commands]
    for command in commands:
        # print(command)

        try:
            mycursor = mydb.cursor()
            mycursor.execute(command)
            mydb.commit()
        except Exception as e:
            print(e)
            continue

# close the connection
mydb.close()

# add option to run github desktop script

# connect to the new user
student = mysql.connector.connect(
    host="localhost",
    user="student",
    password="student",
)

studentcursor = student.cursor()
studentcursor.execute("SHOW DATABASES")
output = studentcursor.fetchall()
# print the databases
for x in output:
    print(x)

# close the connection
student.close()