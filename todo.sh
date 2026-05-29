#!/bin/bash

TODO_FILE="tasks.txt"

# Create file if it doesn't exist
touch $TODO_FILE

while true
do
    echo ""
    echo "===== TO-DO LIST MANAGER ====="
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Delete Task"
    echo "4. Exit"
    echo "=============================="
    
    read -p "Choose an option: " option

    case $option in

        1)
            echo ""
            echo "Your Tasks:"
            if [ -s $TODO_FILE ]; then
                nl -w2 -s'. ' $TODO_FILE
            else
                echo "No tasks found."
            fi
            ;;

        2)
            read -p "Enter new task: " task
            echo "$task" >> $TODO_FILE
            echo "Task added successfully."
            ;;

        3)
            echo ""
            nl -w2 -s'. ' $TODO_FILE

            read -p "Enter task number to delete: " num

            sed -i "${num}d" $TODO_FILE

            echo "Task deleted successfully."
            ;;

        4)
            echo "Exiting program..."
            break
            ;;

        *)
            echo "Invalid option. Try again."
            ;;
    esac

done
