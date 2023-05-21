#!/bin/bash

if [ ! -f "todos.txt" ]; then
    touch "todos.txt"
fi



welcome_message() {
  echo "========================"
  echo "======= To-Do-App ======"
  echo "========================"
  echo ""
}

task_menu() {
  echo "Current Tasks:"
  cat -n todos.txt
  echo ""
  echo "------"

}

check_menu() {
  echo "Do you want to Add or Complete a Task?"
  select vt in "Add" "Complete"; do
    case $vt in
        Add ) add_task;;
        Complete ) remove_task;;
    esac
done

}

add_task() {
  update  
  echo "What do you want to add? (q to return to start menu)"
  read input
  check_quit
  echo "$input" >> todos.txt
  start_menu
}

remove_task() {
  update 
  echo "What do you want to remove? (q to return to start menu) (blank to delete all)"
  read input
  check_quit
  sed -i "${input}d" todos.txt
  start_menu

}
start_menu() {
  update
  check_menu

}

update() {
  clear
  welcome_message
  task_menu
}

check_quit() {
  if [ $input = q ] 
  then
    start_menu
  fi
}

start_menu
